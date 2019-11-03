import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  List<BarItems> _barItems = [];
  List<BarItems> get barItems => _barItems;

  List<TourItems> _tourItems = [];
  List<TourItems> get tourItems => _tourItems;

  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  void addToCart(CartItem item) {
    _cartItems.add(item);

//    if (_cart.containsKey(index)) {
//      _cart[index] += 1;
//    } else {
//      _cart[index] = 1;
//    }
    notifyListeners();
  }


  void addToCartBar(BarItem item) {
    _barItems.add(item);
//    if (_cart.containsKey(index)) {
//      _cart[index] += 1;
//    } else {
//      _cart[index] = 1;
//    }
    notifyListeners();
  }

  void addToCartTour(TourItem item) {
    _tourItems.add(item);
//    if (_cart.containsKey(index)) {
//      _cart[index] += 1;
//    } else {
//      _cart[index] = 1;
//    }
    notifyListeners();
  }

  void clear(String type, index) {
    _cartItems.removeAt(index);

    print('Remove from cart');
    if (type == 'Bar') {
      barItems.removeAt(index);
    }

    notifyListeners();

//    if (_cart.containsKey(index)) {
//      _cart.remove(index);
//      notifyListeners();
//    }
  }
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

abstract class CartItems {}

class CartItem implements TourItems {
  final String type;
  final String placeName;
  final String name;
  final List<String> parameters;
  final int price;

  CartItem(this.type, this.name, this.placeName, this.parameters, this.price,);
}