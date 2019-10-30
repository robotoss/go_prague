import 'package:flutter/material.dart';
import 'package:go_prague/theme/mainTheme.dart';

class CartScreenStep1 extends StatefulWidget {
  @override
  _CartScreenStep1State createState() => _CartScreenStep1State();
}

class _CartScreenStep1State extends State<CartScreenStep1> {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int _totalCount = 0;
    print(bloc.restaurantItems.length);
    if (bloc.restaurantItems.length > 0) {
      _totalCount = bloc.restaurantItems.length;
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 190,
            color: ColorPalette().mainBlack,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 15,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30,),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                            'Virtual Check-Out',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700,color: Colors.white,)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
