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
      if(item.name == f.name && item.placeName == f.placeName) {
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

  void changeQuantity (int index,  bool plus ) {
    int _summ = _cartItems[index].price;
    double _price = _cartItems[index].price / _cartItems[index].quantity;

    if(plus){
     if(_cartItems[index].quantity < 20){
       _cartItems[index].quantity++;
       _cartItems[index].price = _price.toInt() *  _cartItems[index].quantity;
     }
    } else {
     if(_cartItems[index].quantity > 1){
       _cartItems[index].quantity--;
       _cartItems[index].price = _price.toInt() *  _cartItems[index].quantity;
     }
    }


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