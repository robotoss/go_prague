import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/hotelRestaurantItems.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:provider/provider.dart';

import 'productCard/hotelProductCardScreen.dart';

class HotelRestaurantList extends StatelessWidget {

  static List<HotelRestaurantItems> _hotelRestaurantItems = List();

  Future<List<HotelRestaurantItems>> getRestaurantData() async{
    await Repository().hotelRestaurantList().then((response){
      _hotelRestaurantItems = response;
    });

    return _hotelRestaurantItems;
  }

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<CartBloc>(context);
    int _totalCount = 0;
    print(bloc.restaurantItems.length);
    if (bloc.restaurantItems.length > 0) {
      _totalCount = bloc.restaurantItems.length;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Hotel Restaurant',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black,),
        ),
        centerTitle: true,
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.black, size: 30,),
                onPressed: () {
                },
              ),
              Positioned(
                  top: 3.0,
                  right: 7,
                  child: new Center(
                    child: new Text(
                      '$_totalCount',
                      style: new TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
            ],
          )
        ],
      ),
      body: FutureBuilder(
        future: getRestaurantData(),
        builder: (context, snapshot) {
          return snapshot.data ==null ? Center(child: CircularProgressIndicator(),) : DefaultTabController(
              length: _hotelRestaurantItems.length,
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelPadding: EdgeInsets.only(left: 10,right: 10),
                    isScrollable: true,
                    indicatorColor: ColorPalette().mainGreen,
                    labelStyle: TextStyle(
                      fontSize: 28,
                    ),
                    labelColor: ColorPalette().mainBlack,
                    tabs: List<Widget>.generate(_hotelRestaurantItems.length, (int index){
                      return Tab(text: _hotelRestaurantItems[index].categoryName);

                    })
                  ),
                  Expanded(
                    child: TabBarView(
                      children: List<Widget>.generate(_hotelRestaurantItems.length, (int index){
                        return Container(
                          child: listCards(_hotelRestaurantItems[index].categoryItems),
                        );
                      }),
                    ),
                  )
                ],
              ));
        },
      )
    );
  }

  Widget listCards(List<CategoryItem> itemsData) {
    print('Count ${itemsData.length}');
    return ListView.builder(
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
      itemCount: itemsData.length,
        itemBuilder: (context, index){
          return HotelProductCardScreen(
            categoryItem: itemsData[index],
          );
        }
    );
  }
}


