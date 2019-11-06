import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/hotelBarItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/selectAmount/selectAmount.dart';

class HotelBarProductCardScreen extends StatefulWidget {
  final CategoryItem categoryItem;

  HotelBarProductCardScreen({this.categoryItem});

  @override
  _HotelBarProductCardScreenState createState() =>
      _HotelBarProductCardScreenState();
}

class _HotelBarProductCardScreenState extends State<HotelBarProductCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 2 - 10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0.0, 20)
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 125,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: widget.categoryItem.imageUrl,
                placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
              ),
//                child: Image.network(widget.categoryItem.imageUrl, fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.categoryItem.itemName,
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.categoryItem.description,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 16, color: ColorPalette().textLightDark),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${widget.categoryItem.price} Kč',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorPalette().textLightDark),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${widget.categoryItem.volume} ml',
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorPalette().textLightDark),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SelectAmountMini(),
                      SizedBox(
                        width: 5,
                      ),
                      AddToCartItemButtonMini(item: CartItem(0, 'drink', 'Hotel Bar', '${widget.categoryItem.itemName}', [], widget.categoryItem.price,) ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
