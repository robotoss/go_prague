import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/cityServices.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/restaurant/city/cityRestaurantItemsList/cityRestaurantItemsList.dart';
import 'package:go_prague/ui/services/servicesCity/servicesCityList/servicesCityList.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class ServicesCityPlaceCard extends StatefulWidget {
  final CityServices servicesPlace;

  ServicesCityPlaceCard({
    this.servicesPlace,
  });


  @override
  _ServicesCityPlaceCardState createState() => _ServicesCityPlaceCardState();
}

class _ServicesCityPlaceCardState extends State<ServicesCityPlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesCityList(cityPlaceItems:  widget.servicesPlace.placeItems, placeName: widget.servicesPlace.placeName,)));
        },
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
                    imageUrl: widget.servicesPlace.placeImage,
                    placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.servicesPlace.placeName,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        widget.servicesPlace.placeDescription,
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
                            widget.servicesPlace.placeDistance.toString(),
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
                          MoreBlueButton(widget: ServicesCityList(cityPlaceItems:  widget.servicesPlace.placeItems, placeName: widget.servicesPlace.placeName,),),
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
