import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/cityServices.dart';

import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/services/servicesCity/servicesCityInfoScreen/servicesCityInfoScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class ServiceCityPlaceCard extends StatefulWidget {
  final CategoryItem serviceCityItem;
  final String catName;

  ServiceCityPlaceCard({
    this.serviceCityItem,
    this.catName,
  });


  @override
  _ServiceCityPlaceCardState createState() => _ServiceCityPlaceCardState();
}

class _ServiceCityPlaceCardState extends State<ServiceCityPlaceCard> {

  @override
  Widget build(BuildContext context) {
    print(widget.catName);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceCityInfoScreen(serviceCityItem: widget.serviceCityItem,)));
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
                            imageUrl: widget.serviceCityItem.imageUrl,
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
                        widget.serviceCityItem.itemName,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        widget.serviceCityItem.description,
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
                            widget.catName != 'Room Services' ? '~${widget.serviceCityItem.time}': '',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '${widget.serviceCityItem.price} Kč',
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          MoreBlueButton(widget: ServiceCityInfoScreen(serviceCityItem: widget.serviceCityItem,),),
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
