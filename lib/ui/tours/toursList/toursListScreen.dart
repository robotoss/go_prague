import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:go_prague/ui/tours/toursCard/toursCard.dart';
import 'package:provider/provider.dart';


class ToursListScreen extends StatelessWidget {

  static List<ToursData> _toursItems = List();

  Future<List<ToursData>> getToursData() async{
    await Repository().accountTypes().then((response){
      _toursItems = response;
    });

    return _toursItems;
  }

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
            'Tours',
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
          future: getToursData(),
          builder: (context, snapshot) {
            return snapshot.data ==null ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _toursItems.length,
                itemBuilder: (context, index){
                  return TourCardScreen(
                    tourItem: _toursItems[index],
                  );;
                }
            );
          },
        )
    );
  }

}


