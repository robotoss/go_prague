import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/hotelRestaurantItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/restaurant/hotel/productScreen/ProductRestaurantScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/selectAmount/selectAmount.dart';

class HotelProductCardScreen extends StatefulWidget {
  final CategoryItem categoryItem;

  HotelProductCardScreen({
    this.categoryItem
});


  @override
  _HotelProductCardScreenState createState() => _HotelProductCardScreenState();
}

class _HotelProductCardScreenState extends State<HotelProductCardScreen> {
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
                child: Image.network(widget.categoryItem.imageUrl, fit: BoxFit.cover,),
              ),
             Padding(
               padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     widget.categoryItem.itemName,
                     style: TextStyle(
                       fontSize: 22,
                       fontWeight: FontWeight.w700
                     ),
                   ),
                   Text(
                     widget.categoryItem.description,
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
                         '~${ widget.categoryItem.cookTime} min',
                          style: TextStyle(
                            fontSize: 20,
                            color: ColorPalette().textLightDark
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '${widget.categoryItem.price} Kč',
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorPalette().textLightDark
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SelectAmount(),
                        SizedBox(width: 10,),
                        AddToCartItemButton(),
                        SizedBox(width: 10,),
                        MoreBlueButton(function: ProductRestaurantScreen(categoryItem: widget.categoryItem,),),
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
