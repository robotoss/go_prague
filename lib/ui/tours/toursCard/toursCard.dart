import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/tours/tourInfoScreen/tourInfoScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'dart:math' as math;

class TourCardScreen extends StatefulWidget {
  final ItemTourData tourItem;
  final String catName;

  TourCardScreen({
    this.tourItem,
    this.catName,
  });


  @override
  _TourCardScreenState createState() => _TourCardScreenState();
}

class _TourCardScreenState extends State<TourCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TourInfoScreen(tourData: widget.tourItem,)));
        },
        child: Card(
          child: Container(
//          height: 250,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 125,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 125,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.tourItem.imgUrls[0],
                          placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
                        ),
                      ),
//                      Positioned(
//                        top: 5,
//                        right: 10,
//                        child: Container(
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.all(Radius.circular(8)),
//                            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0)
//                          ),
//                          child: Text(
//                              widget.catName,
//                            style: TextStyle(
//                              fontSize: 16,
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      )
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.tourItem.name,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        widget.tourItem.article,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorPalette().textLightDark
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '~${widget.tourItem.duration}',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '${widget.tourItem.price} Kč',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          MoreBlueButton(widget: TourInfoScreen(tourData: widget.tourItem,),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
