import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_prague/data/models/hotelServices.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/services/servicesHotel/serviceHotelInfoScreen/serviceHotelInfoScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class ServiceHotelCard extends StatefulWidget {
  final HotelServicesCategoryItem serviceHotelItem;
  final String catName;

  ServiceHotelCard({
    this.serviceHotelItem,
    this.catName,
  });


  @override
  _ServiceHotelCardState createState() => _ServiceHotelCardState();
}

class _ServiceHotelCardState extends State<ServiceHotelCard> {

  @override
  Widget build(BuildContext context) {
    print(widget.catName);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceHotelInfoScreen(serviceHotelItem: widget.serviceHotelItem,)));
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
                          child: CachedNetworkImage(
                            height: 125,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: widget.serviceHotelItem.imageUrl,
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
                        widget.serviceHotelItem.itemName,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        widget.serviceHotelItem.description,
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
                            widget.catName != 'Room Services' ? '~${widget.serviceHotelItem.duration}': '',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '${widget.serviceHotelItem.price} Kč',
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          MoreBlueButton(widget: ServiceHotelInfoScreen(serviceHotelItem: widget.serviceHotelItem,),),
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
