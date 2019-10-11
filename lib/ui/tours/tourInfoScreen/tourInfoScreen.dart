import 'package:flutter/material.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/theme/mainTheme.dart';

class TourInfoScreen extends StatefulWidget {
  final ToursData tourData;

  TourInfoScreen({
    this.tourData,
  });

  @override
  _TourInfoScreenState createState() => _TourInfoScreenState();
}

class _TourInfoScreenState extends State<TourInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 255,),
                Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(const Radius.circular(5.0))
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.tourData.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                             'Number of tourists',
                              style: TextStyle(
                                color: ColorPalette().textLightDark,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  '${widget.tourData.duration} h.',
                                style: TextStyle(
                                  color: ColorPalette().textLightDark,
                                  fontSize: 22,
//                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                widget.tourData.price == 0 ? 'Free' : '${widget.tourData.price} Kč',
                                style: TextStyle(
                                    color: ColorPalette().textLightDark,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(const Radius.circular(5.0))
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.tourData.article,
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorPalette().textLightDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
