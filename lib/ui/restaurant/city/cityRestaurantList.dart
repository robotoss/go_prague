import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/cityRestaurantItems.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:provider/provider.dart';

import 'restaurantCard/cityRestaurantCard.dart';

class CityRestaurantList extends StatelessWidget {

  static List<CityRestaurantItems> _hotelRestaurantItems = List();

  static List<String> _tabList = List();

  Future<List<CityRestaurantItems>> getCityRestaurantData() async{

    await Repository().cityRestaurantList().then((response){
      _hotelRestaurantItems = response;
      _hotelRestaurantItems.forEach((f){
        _tabList.add(f.restaurantType);
      });
      _tabList = _tabList.toSet().toList();
    });
    print('Дата которая приходит - $_hotelRestaurantItems');
    return _hotelRestaurantItems;
  }

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<CartBloc>(context);
    int _totalCount = 0;
    print(bloc.cartItems.length);
    if (bloc.cartItems.length > 0) {
      _totalCount = bloc.cartItems.length;
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
            'City Restaurants',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black,),
          ),
          centerTitle: true,
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.black, size: 30,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreenStep1()));
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
          future: getCityRestaurantData(),
          builder: (context, snapshot) {

            return snapshot.data == null ? Center(child: CircularProgressIndicator(),) : DefaultTabController(
                length: _tabList.length,
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
                        tabs: List<Widget>.generate(_tabList.length, (int index){
                          return Tab(text: _tabList[index]);

                        })
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List<Widget>.generate(_tabList.length, (int index){
                          return Container(
                            child: listCards(_hotelRestaurantItems, _tabList[index]),
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

  Widget listCards(List<CityRestaurantItems> itemsData, String categoryName) {

    List<CityRestaurantItems> filterList = List();
    itemsData.forEach((f){
      if(categoryName == f.restaurantType){
        filterList.add(f);
      }
    });
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: filterList.length,
        itemBuilder: (context, index){
          return CityRestaurantCardScreen(
            categoryItem: filterList[index],
          );
        }
    );
  }
}


