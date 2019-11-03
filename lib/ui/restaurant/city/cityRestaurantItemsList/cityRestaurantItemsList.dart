import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/cityRestaurantItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:go_prague/ui/restaurant/city/cityRestaurantProductCard/cityRestaurantProductCard.dart';
import 'package:provider/provider.dart';



class CityRestaurantListScreen extends StatelessWidget {

  final List<CityRestaurantItem> hotelRestaurantItems;
  final String restaurantName;

  CityRestaurantListScreen({this.hotelRestaurantItems, this.restaurantName});

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<CartBloc>(context);
    int _totalCount = 0;
    print(bloc.restaurantItems.length);
    if (bloc.restaurantItems.length > 0) {
      _totalCount = bloc.restaurantItems.length + bloc.barItems.length + bloc.tourItems.length;
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
            '$restaurantName',
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
        body: DefaultTabController(
            length: hotelRestaurantItems.length,
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
                    tabs: List<Widget>.generate(hotelRestaurantItems.length, (int index){
                      return Tab(text: hotelRestaurantItems[index].categoryName);

                    })
                ),
                Expanded(
                  child: TabBarView(
                    children: List<Widget>.generate(hotelRestaurantItems.length, (int index){
                      return Container(
                        child: listCards(hotelRestaurantItems[index].categoryItems),
                      );
                    }),
                  ),
                )
              ],
            ))
    );
  }

  Widget listCards(List<CategoryItem> itemsData) {
    print('Count ${itemsData.length}');
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: itemsData.length,
        itemBuilder: (context, index){
          return CityRestaurantProductCard(
            categoryItem: itemsData[index],
            restaurantName: restaurantName,
          );
        }
    );
  }
}


