import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;



//  Map<int, int> _cart = {};
//
//  Map<int, int> get cart => _cart;

  void addToCart(CartItem item) {
    print('Этап 1');

    bool isItemFound = false;

    _cartItems.forEach((f){
      print('Этап 2');
      if(item.name == f.name) {
        isItemFound = true;
        f.quantity = f.quantity + item.quantity;
        f.price = (f.price + item.price);
      }
    });
    print('Этап 3');

    if(!isItemFound){
      item.price = item.price * item.quantity;
      _cartItems.add(item);
    }



//    if (_cart.containsKey(index)) {
//      _cart[index] += 1;
//    } else {
//      _cart[index] = 1;
//    }
    notifyListeners();
  }


  void clear(int index) {
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
  int index;
  final String type;
  final String placeName;
  final String name;
  final List<String> parameters;
  int price;
  int quantity;


  CartItem(this.index, this.type, this.placeName, this.name, this.parameters, this.price, this.quantity);
}