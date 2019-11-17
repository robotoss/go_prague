import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/cityServices.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:go_prague/ui/services/servicesCity/serviceCityPlaceCard/serviceCityPlaceCard.dart';
import 'package:provider/provider.dart';


class ServicesCityList extends StatelessWidget {
  final List<PlaceItem> cityPlaceItems;
  final String placeName;

  ServicesCityList({this.cityPlaceItems, this.placeName});


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
            '$placeName',
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
            length: cityPlaceItems.length,
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
                    tabs: List<Widget>.generate(cityPlaceItems.length, (int index){
                      return Tab(text: cityPlaceItems[index].categoryName);

                    })
                ),
                Expanded(
                  child: TabBarView(
                    children: List<Widget>.generate(cityPlaceItems.length, (int index){
                      return Container(
                        child: listCards(cityPlaceItems[index].categoryItems, cityPlaceItems[index].categoryName),
                      );
                    }),
                  ),
                )
              ],
            ))
    );
  }
}

Widget listCards(List<CategoryItem> itemsData, String catName) {
  print('Count ${itemsData.length}');
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: itemsData.length,
      itemBuilder: (context, index){
        return ServiceCityPlaceCard(
          serviceCityItem: itemsData[index],
          catName: catName,
        );
      }
  );
}

