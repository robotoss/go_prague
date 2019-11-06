import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:provider/provider.dart';


import '../cartWidget/categoryListWidget.dart';

class CartScreenStep1 extends StatefulWidget {
  @override
  _CartScreenStep1State createState() => _CartScreenStep1State();
}

class _CartScreenStep1State extends State<CartScreenStep1> {

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
                          'Step 1:',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white.withOpacity(0.7)
                          ),
                        ),
                        Text(
                          'Summary',
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
                            color: Colors.white.withOpacity(0.4),
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
                          _showEat ? CategoryCartList(type: 'eat', cartItems: _eatItems,) : Container(),
                          _showDrink ? CategoryCartList(type: 'drink', cartItems: _drinkItems,) : Container(),
                          _showToGo ? CategoryCartList(type: 'ToGo', cartItems: _toGoItems,) : Container(),

//                          Expanded(
//                            child: Column(
//                              mainAxisSize: MainAxisSize.max,
//                              children: <Widget>[
//                                SizedBox(height: 20,),
//                                bloc.restaurantItems.isNotEmpty ? Row(
//                                  children: <Widget>[
//                                    Text(
//                                      'Orders in Eat category',
//                                      style: TextStyle(
//                                        fontSize: 24,
//                                        fontWeight: FontWeight.w700,
//                                      ),
//                                    ),
//                                    Divider(
//                                      height: 5,
//                                      color: Colors.black,
//                                    )
//                                  ],
//                                ) : Container(),
//
//                                Padding(
//                                  padding: const EdgeInsets.only(top: 30),
//                                  child: bloc.restaurantItems.isNotEmpty ? GestureDetector(
//                              onTap: (){
//                                  setState(() {
//                                    _showHotel = !_showHotel;
//                                  });
//                              },
//                              child: Container(
//                                  color: Colors.transparent,
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      Text(
//                                        'Total',
//                                        style: TextStyle(
//                                          fontSize: 24,
//                                          fontWeight: FontWeight.w700
//                                        ),
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text(
//                                            '$_restarauntTotal Kč',
//                                            style: TextStyle(
//                                              fontSize: 20
//                                            ),
//                                          ),
//                                          !_showHotel ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up)
//                                        ],
//                                      )
//                                    ],
//                                  ),
//                              ),
//                            ) : Container(),
//                                ),
//                                bloc.restaurantItems.isNotEmpty ? Divider(height: 5, color: Colors.black,) : Container(),
//                                _showHotel ? Expanded(
//                                child: ListView.builder(
//                                    itemCount: _totalCount,
//                                    itemBuilder: (context,index){
//                                      RestaurantItem _restaurantItem = bloc.restaurantItems[index];
//                                      return Row(
//                                        children: <Widget>[
//                                          Expanded(
//                                            flex: 7,
//                                            child: Text(
//                                              _restaurantItem.name,
//                                              style: TextStyle(
//                                                  fontSize: 16,
//                                                  fontWeight: FontWeight.w700
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            flex: 2,
//                                            child: Text(
//                                              '${_restaurantItem.price} Kč',
//                                              textAlign: TextAlign.right,
//                                              style: TextStyle(
//                                                  fontSize: 16,
//                                                  fontWeight: FontWeight.w700
//                                              ),
//                                            ),
//                                          ),
//                                          Expanded(
//                                            flex: 1,
//                                            child: IconButton(
//                                                icon: Icon(Icons.delete_outline),
//                                                onPressed: (){
//                                                  setState(() {
//                                                    bloc.clear(_restaurantItem.type, index,);
//                                                  });
//                                                }),
//                                          )
//                                        ],
//                                      );
//                                    }
//                                ),
//                              ) : Container(),
//                            ],),
//                          )
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