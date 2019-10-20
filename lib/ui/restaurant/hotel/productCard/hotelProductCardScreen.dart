import 'package:flutter/material.dart';
import 'package:go_prague/data/models/hotelRestaurantItems.dart';
import 'package:go_prague/theme/mainTheme.dart';

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
            children: <Widget>[
              Container(
                height: 125,
                width: double.infinity,
                child: Image.network(widget.categoryItem.imageUrl, fit: BoxFit.cover,),
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
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
             )
            ],
          ),
        ),
      ),
    );
  }
}
