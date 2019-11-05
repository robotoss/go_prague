import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/cityRestaurantItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/restaurant/city/cityProductInfo/cityProductInfoScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/selectAmount/selectAmount.dart';
import 'package:provider/provider.dart';

class CityRestaurantProductCard extends StatefulWidget {
  final String restaurantName;
  final CategoryItem categoryItem;

  CityRestaurantProductCard({
    this.restaurantName,
    this.categoryItem
  });


  @override
  _CityRestaurantProductCardState createState() => _CityRestaurantProductCardState();
}

class _CityRestaurantProductCardState extends State<CityRestaurantProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CityProductInfoScreen(categoryItem: widget.categoryItem, restaurantName: widget.restaurantName)));
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
                    imageUrl: widget.categoryItem.imageUrl,
                    placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
                  ),
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
                          AddToCartItemButton(addToCart:  (){Provider.of<CartBloc>(context).addToCart(CartItem('eat', widget.restaurantName, widget.categoryItem.itemName, [], widget.categoryItem.price,));},),
                          SizedBox(width: 10,),
                          MoreBlueButton(widget: CityProductInfoScreen(categoryItem: widget.categoryItem, restaurantName: widget.restaurantName),),
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
