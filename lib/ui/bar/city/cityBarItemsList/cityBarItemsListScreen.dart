import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/cityBarItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/bar/city/cityBarProductCard/cityBarProductCard.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:provider/provider.dart';



class CityBarListScreen extends StatelessWidget {

  final List<CityBarItem> hotelBarItems;
  final String barName;

  CityBarListScreen({this.hotelBarItems, this.barName});

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
            '$barName',
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
            length: hotelBarItems.length,
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
                    tabs: List<Widget>.generate(hotelBarItems.length, (int index){
                      return Tab(text: hotelBarItems[index].categoryName);

                    })
                ),
                Expanded(
                  child: TabBarView(
                    children: List<Widget>.generate(hotelBarItems.length, (int index){
                      return Container(
                        child: listCards(hotelBarItems[index].categoryItems),
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
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(itemsData.length, (index) {
        return CityBarProductCard(
            categoryItem: itemsData[index],
          barName: barName,
        );
      },
      ),
    );
  }
}


