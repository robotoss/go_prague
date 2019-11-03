import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;



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


  void clear(String type, index) {
    _cartItems.removeAt(index);

    notifyListeners();

//    if (_cart.containsKey(index)) {
//      _cart.remove(index);
//      notifyListeners();
//    }
  }
}

abstract class CartItems {}

class CartItem implements CartItems {
  final String type;
  final String placeName;
  final String name;
  final List<String> parameters;
  final int price;

  CartItem(this.type, this.name, this.placeName, this.parameters, this.price,);
}