import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/cityRestaurantItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/restaurant/city/cityRestaurantItemsList/cityRestaurantItemsList.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class CityRestaurantCardScreen extends StatefulWidget {
  final CityRestaurantItems categoryItem;


  CityRestaurantCardScreen({
    this.categoryItem,
  });


  @override
  _CityRestaurantCardScreenState createState() => _CityRestaurantCardScreenState();
}

class _CityRestaurantCardScreenState extends State<CityRestaurantCardScreen> {
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
                  imageUrl: widget.categoryItem.restaurantImage,
                  placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.categoryItem.restaurantName,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      widget.categoryItem.restaurantArticle,
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
                        MoreBlueButton(function: CityRestaurantListScreen(hotelRestaurantItems:  widget.categoryItem.cityRestaurantItems, restaurantName: widget.categoryItem.restaurantName,),),
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
