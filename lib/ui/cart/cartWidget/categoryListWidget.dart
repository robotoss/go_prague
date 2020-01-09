import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:provider/provider.dart';

import 'categoryItemsList.dart';

//class CategoryCartList extends StatefulWidget {
//  final String type;
//  final List<CartItem> cartItems;
//
//
//  CategoryCartList({this.type, this.cartItems});
//
//  @override
//  _CategoryCartListState createState() => _CategoryCartListState();
//}
//
//class _CategoryCartListState extends State<CategoryCartList> {
//
//  int _restaurantTotal = 0;
//
//  String _categoryName;
//  static List<String> placeNames = List();
//
//
//  void changeCategoryName() {
//    if (widget.type == 'eat') {
//      _categoryName = 'Orders in Eat category';
//    } else if (widget.type == 'drink') {
//      _categoryName = 'Orders in Drink category';
//    } else if (widget.type == 'ToGo') {
//      _categoryName = 'Orders in To Go category';
//    }
//  }
//
//
//
//  void setByCategory() {
//    placeNames.clear();
//    widget.cartItems.forEach((f){
//     if(f.type == widget.type){
//       placeNames.add(f.placeName);
//     }
//    });
//    placeNames = placeNames.toSet().toList();
//  }
//
//
//
//  @override
//  void initState() {
//    super.initState();
//    changeCategoryName();
//    setByCategory();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    var bloc = Provider.of<CartBloc>(context);
//    print('PLACED_NAMES - ${placeNames}');
//    return Column(
////      mainAxisSize: MainAxisSize.max,
//      children: <Widget>[
//        SizedBox(
//          height: 20,
//        ),
//        Row(
//          children: <Widget>[
//            Text(
//              _categoryName,
//              style: TextStyle(
//                fontSize: 24,
//                fontWeight: FontWeight.w700,
//              ),
//            ),
//            SizedBox(
//              width: 10,
//            ),
//            Expanded(
//              child: Container(
//                height: 3,
//                color: ColorPalette().mainBlack,
//              ),
//            )
//          ],
//        ),
//        ListView.builder(
//          scrollDirection: Axis.vertical,
//            itemCount: placeNames.length,
//            shrinkWrap: true,
//            physics: NeverScrollableScrollPhysics(),
//            itemBuilder: (context, index){
//            print('PLACED_NAMES - ${placeNames[index]}');
//            return ListItemsInCart(allCartItems: widget.cartItems, placeName: placeNames[index],);
//            }
//        )
//
//      ],
//    );
//  }
//}

class CategoryCartList extends StatelessWidget {
  final String type;
  final List<CartItem> cartItems;


  CategoryCartList({this.type, this.cartItems});

  static int _restaurantTotal = 0;

  static String _categoryName;
  static List<String> placeNames = List();


  void changeCategoryName() {
    if (type == 'eat') {
      _categoryName = 'Orders in Eat category';
    } else if (type == 'drink') {
      _categoryName = 'Orders in Drink category';
    } else if (type == 'togo') {
      _categoryName = 'Orders in To Go category';
    }
  }

  void setByCategory() {
    placeNames.clear();
    cartItems.forEach((f){
      if(f.type == type){
        placeNames.add(f.placeName);
      }
    });
    placeNames = placeNames.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    changeCategoryName();
    setByCategory();
    var bloc = Provider.of<CartBloc>(context);
    return Column(
//      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Text(
              _categoryName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 3,
                color: ColorPalette().mainBlack,
              ),
            )
          ],
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: placeNames.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              print('PLACED_NAMES - ${placeNames[index]}');
              return ListItemsInCart(allCartItems: cartItems, placeName: placeNames[index], type: type,);
            }
        )

      ],
    );
  }
}

