import 'package:flutter/material.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/tours/tourInfoScreen/tourInfoScreen.dart';
import 'package:go_prague/ui/widgets/carousel/carousel.dart';

class HomeScreen extends StatelessWidget {
  static List<Widget> elements = List();
  static double carouselHeight = 160;

  Future<List<ToursData>> getSlides(
    BuildContext context,
  ) async {
    List<ToursData> _listData;
    await Repository().accountTypes().then((toursList) {
      _listData = toursList;
      if(elements.isEmpty) {
        toursList.forEach((slide) {
          elements.add(carouselItem(context, slide, carouselHeight));
        });
      }
    });
    return _listData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Welcome in Go.Prague',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 130,
            color: ColorPalette().mainBlack,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FutureBuilder(
                  future: getSlides(context),
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? MainCarousel(
                            elements: elements,
                            height: carouselHeight,
                          )
                        : loadData(context, carouselHeight);
                  }),
            ],
          )
        ],
      ),
    );
  }
}

Widget loadData(BuildContext context,  double carouselHeight){
  return Container(
    height: carouselHeight,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget carouselItem(BuildContext context, ToursData sliderData, double carouselHeight) {
  return Container(
    height: carouselHeight,
    width: MediaQuery.of(context).size.width,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                sliderData.imgUrls[0],
              ),
              fit: BoxFit.cover)),
      child: Container(
        color: Colors.black.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                sliderData.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
            ),
//            SizedBox(
//              height: 40,
//            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: SizedBox(
                height: 30,
                width: 150,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TourInfoScreen(tourData: sliderData,)));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: ColorPalette().mainGreen,
                    child: Text(
                      'GO',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    )),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
