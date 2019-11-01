import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/tours/tourInfoScreen/tourInfoScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class TourCardScreen extends StatefulWidget {
  final ItemTourData tourItem;

  TourCardScreen({
    this.tourItem
  });


  @override
  _TourCardScreenState createState() => _TourCardScreenState();
}

class _TourCardScreenState extends State<TourCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.tourItem.imgUrls[0],
                  placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
                ),
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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '~${ widget.tourItem.duration} h.',
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorPalette().textLightDark
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '${widget.tourItem.price} Kč',
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorPalette().textLightDark
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        MoreBlueButton(function: TourInfoScreen(tourData: widget.tourItem,),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
