import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class MainCarousel extends StatefulWidget {
  final List elements;
  final List<String> imgList;
  final double height;

  MainCarousel({
    this.elements,
    this.imgList,
    this.height
  });

  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(children: [
        CarouselSlider(
          items: widget.elements,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          height: widget.height,
          aspectRatio: 16/9,
          pauseAutoPlayOnTouch: Duration(seconds: 5),
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                widget.elements,
                    (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(255, 255, 255, 0.9)
                            : Color.fromRGBO(255, 255, 255, 0.4)),
                  );
                },
              ),
            ),
          ),
        ),

      ]),
    );
  }
}


class InfoCarousel extends StatefulWidget {
  final List elements;
  final double height;

  InfoCarousel({
    this.elements,
    this.height
  });

  @override
  _InfoCarouselState createState() => _InfoCarouselState();
}

class _InfoCarouselState extends State<InfoCarousel> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(children: [
        CarouselSlider(
          items: widget.elements,
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          height: widget.height,
          aspectRatio: 16 / 9,
          pauseAutoPlayOnTouch: Duration(seconds: 5),
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                widget.elements,
                    (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(255, 255, 255, 0.9)
                            : Color.fromRGBO(255, 255, 255, 0.4)),
                  );
                },
              ),
            ),
          ),
        ),

      ]),
    );
  }
}
