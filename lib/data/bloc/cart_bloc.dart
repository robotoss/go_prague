import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {

  List<RestaurantItems> _restaurantItems = [];
  List<RestaurantItems> get restaurantItems => _restaurantItems;

  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  void addToCart(RestaurantItem item) {
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

  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}

abstract class RestaurantItems {}

class RestaurantItem implements RestaurantItems {
  final String nameRestaurant;
  final String name;
  final int price;

  RestaurantItem(this.nameRestaurant, this.name, this.price,);
}