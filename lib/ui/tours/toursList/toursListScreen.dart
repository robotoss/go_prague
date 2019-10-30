import 'package:flutter/material.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/ui/tours/toursCard/toursCard.dart';


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
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black, size: 30,),
              onPressed: () {
              },
            ),
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


