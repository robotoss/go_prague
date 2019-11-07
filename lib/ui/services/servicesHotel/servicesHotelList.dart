import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/hotelServices.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:provider/provider.dart';

import 'serviceHotelCard/serviceHotelCard.dart';

class ServicesHotelList extends StatelessWidget {

  static List<HotelServices> _toursItems = List();

  Future<List<HotelServices>> getServiceHotelData() async{
    await Repository().hotelService().then((response){
      _toursItems = response;
    });

    return _toursItems;
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
            'Hotel Service',
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
          future: getServiceHotelData(),
          builder: (context, snapshot) {
            return snapshot.data ==null ? Center(child: CircularProgressIndicator(),) : DefaultTabController(
                length: _toursItems.length,
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
                        tabs: List<Widget>.generate(_toursItems.length, (int index){
                          return Tab(text: _toursItems[index].categoryName);

                        })
                    ),
                    Expanded(
                      child: TabBarView(
                        children: List<Widget>.generate(_toursItems.length, (int index){
                          return Container(
                            child: listCards(_toursItems[index].categoryItems, _toursItems[index].categoryName),
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
}

Widget listCards(List<HotelServicesCategoryItem> itemsData, String catName) {
  print('Count ${itemsData.length}');
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: itemsData.length,
      itemBuilder: (context, index){
        return ServiceHotelCard(
          serviceHotelItem: itemsData[index],
          catName: catName,
        );
      }
  );
}

