import 'package:flutter/material.dart';
import 'package:go_prague/data/models/hotelRestaurantItems.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';

import 'productCard/hotelProductCardScreen.dart';

class HotelRestaurantList extends StatelessWidget {

  List<HotelRestaurantItems> _hotelRestaurantItems = List();

  Future<List<HotelRestaurantItems>> getRestaurantData() async{
    await Repository().hotelRestaurantList().then((response){
      _hotelRestaurantItems = response;
    });

    return _hotelRestaurantItems;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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


