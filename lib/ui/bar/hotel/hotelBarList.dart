import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/hotelBarItems.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';

import 'productCard/hotelBarProductCardScreen.dart';

class HotelBarList extends StatelessWidget {

  static List<HotelBartItems> _hotelBarItems = List();

  Future<List<HotelBartItems>> getBarData() async{
    await Repository().hotelBarList().then((response){
      _hotelBarItems = response;
    }).catchError((error){
      if (error is DioError) {
        print(error.message);
      } else {
        print(error.toString());
      }
    });

    return _hotelBarItems;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Hotel Bar',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black,),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black,),
              onPressed: () {
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: getBarData(),
          builder: (context, snapshot) {
            return snapshot.data == null ? Center(child: CircularProgressIndicator(),) : DefaultTabController(
                length: _hotelBarItems.length,
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
                        tabs: List<Widget>.generate(_hotelBarItems.length, (int index){
                          return Tab(text: _hotelBarItems[index].categoryName);
                        })
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List<Widget>.generate(_hotelBarItems.length, (int index){
                          return Container(
                            child: listCards(_hotelBarItems[index].categoryItems),
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

//  Widget listCards(List<CategoryItem> itemsData) {
//    print('Count ${itemsData.length}');
//    return ListView.builder(
//        shrinkWrap: true,
//        scrollDirection: Axis.vertical,
//        itemCount: itemsData.length,
//        itemBuilder: (context, index){
//          return HotelBarProductCardScreen(
//            categoryItem: itemsData[index],
//          );
//        }
//    );
//  }

  Widget listCards(List<CategoryItem> itemsData) {
    print('Count ${itemsData.length}');
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(itemsData.length, (index) {
      return HotelBarProductCardScreen(
            categoryItem: itemsData[index]);
    },
    ),
    );
  }
}