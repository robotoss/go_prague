import 'package:flutter/material.dart';
import 'package:go_prague/data/models/upcomingEvents.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/ui/events/eventCard/eventCard.dart';

class EventsList extends StatelessWidget {
  static List<UpcomingEvents> _hotelRestaurantItems = List();

  Future<List<UpcomingEvents>> getRestaurantData() async {
    await Repository().upcomingEventsList().then((response) {
      _hotelRestaurantItems = response;
    });
    return _hotelRestaurantItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Events',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getRestaurantData(),
        builder: (context, snapshot) {
          return snapshot.data == null ? CircularProgressIndicator() : ListView.builder(
            itemCount: _hotelRestaurantItems.length,
              itemBuilder: (context, index){
                return EventCard(event: _hotelRestaurantItems[index],);
              }
          );
        },
      )
    );
  }
}
