import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {

  List<RestaurantItems> _restaurantItems = [];
  List<RestaurantItems> get restaurantItems => _restaurantItems;

  List<BarItems> _barItems = [];
  List<BarItems> get barItems => _barItems;

  List<TourItems> _tourItems = [];
  List<TourItems> get tourItems => _tourItems;

  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  void addToCartRestaurant(RestaurantItem item) {
    _restaurantItems.add(item);
    print('Add to cart');
    print(_restaurantItems.length);
//    if (_cart.containsKey(index)) {
//      _cart[index] += 1;
//    } else {
//      _cart[index] = 1;
//    }
    notifyListeners();
  }

  void addToCartBar(BarItem item) {
    _barItems.add(item);
    print('Add to cart');
    print(_restaurantItems.length);
//    if (_cart.containsKey(index)) {
//      _cart[index] += 1;
//    } else {
//      _cart[index] = 1;
//    }
    notifyListeners();
  }

  void addToCartTour(TourItem item) {
    _tourItems.add(item);
    print('Add to cart');
    print(_restaurantItems.length);
//    if (_cart.containsKey(index)) {
//      _cart[index] += 1;
//    } else {
//      _cart[index] = 1;
//    }
    notifyListeners();
  }

  void clear(String type, index) {
    print('Remove from cart');
    if(type == 'Restaurant'){
      _restaurantItems.removeAt(index);
    } else if (type == 'Bar') {
      barItems.removeAt(index);
    }

    notifyListeners();
    print('Cart count - ${_restaurantItems.length}');
//    if (_cart.containsKey(index)) {
//      _cart.remove(index);
//      notifyListeners();
//    }
  }
}

abstract class RestaurantItems {}

class RestaurantItem implements RestaurantItems {
  final String nameRestaurant;
  final String name;
  final int price;
  final String type;

  RestaurantItem(this.nameRestaurant, this.name, this.price, this.type);
}


abstract class BarItems {}

class BarItem implements BarItems {
  final String nameBar;
  final String name;
  final int price;
  final String type;

  BarItem(this.nameBar, this.name, this.price, this.type);
}

abstract class TourItems {}

class TourItem implements TourItems {
  final String nameTour;
  final int price;
  final String type;

  TourItem(this.nameTour, this.price, this.type);
}