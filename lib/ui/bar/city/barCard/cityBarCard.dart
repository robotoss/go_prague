import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/cityBarItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/bar/city/cityBarItemsList/cityBarItemsListScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class CityBarCard extends StatefulWidget {
  final CityBarItems categoryItem;

  CityBarCard({
    this.categoryItem
  });


  @override
  _CityBarCardState createState() => _CityBarCardState();
}

class _CityBarCardState extends State<CityBarCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 250,
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
                  imageUrl: widget.categoryItem.barImage,
                  placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.categoryItem.barName,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      widget.categoryItem.barArticle,
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
                          widget.categoryItem.restaurantDistance,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorPalette().textLightDark,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          'kilometers from you',
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorPalette().textLightDark
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        MoreBlueButton(function: CityBarListScreen(hotelBarItems:  widget.categoryItem.cityBarItems, barName: widget.categoryItem.barName,),),
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
