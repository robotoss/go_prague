import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:provider/provider.dart';


import '../cartWidget/categoryListWidget.dart';

class CartScreenStep2 extends StatefulWidget {
  @override
  _CartScreenStep2State createState() => _CartScreenStep2State();
}

class _CartScreenStep2State extends State<CartScreenStep2> {

  bool _showEat = false;
  bool _showDrink = false;
  bool _showToGo = false;


  List<CartItem> _cartItems = List();
  List<CartItem> _eatItems = List();
  List<CartItem> _drinkItems = List();
  List<CartItem> _toGoItems = List();

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    _cartItems = bloc.cartItems;
    _eatItems = List();
    _drinkItems = List();
    _toGoItems = List();
    _cartItems.forEach((f){
      f.index = _cartItems.indexOf(f);
    });
    _cartItems.forEach((f){
      if(f.type == 'eat'){
        _eatItems.add(f);
        _showEat = true;
      } else if (f.type == 'drink'){
        _showDrink = true;
        _drinkItems.add(f);
      } else if (f.type == 'ToGo'){
        _showToGo = true;
        _toGoItems.add(f);
      }
    });
//    int _totalCount = 0;
//    print(bloc.restaurantItems.length);
//    if (bloc.restaurantItems.length > 0) {
//
//      _totalCount = bloc.restaurantItems.length;
//    }



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
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: double.infinity,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                        'Virtual Check-Out',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: Colors.white,)),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Step 2:',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white.withOpacity(0.7)
                          ),
                        ),
                        Text(
                          'Order confirmation',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(const Radius.circular(10.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView(
                          children: <Widget>[

                          ],
                        ),
                      )

                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}