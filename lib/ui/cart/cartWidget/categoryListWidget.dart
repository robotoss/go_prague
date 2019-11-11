import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep2.dart';
import 'package:provider/provider.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class CategoryCartList extends StatefulWidget {
  final String type;
  final List<CartItem> cartItems;

  CategoryCartList({this.type, this.cartItems});

  @override
  _CategoryCartListState createState() => _CategoryCartListState();
}

class _CategoryCartListState extends State<CategoryCartList> {
  bool _showHotel = false;
  int _restaurantTotal = 0;

  String _categoryName;

  void changeCategoryName() {
    if (widget.type == 'eat') {
      _categoryName = 'Orders in Eat category';
    } else if (widget.type == 'drink') {
      _categoryName = 'Orders in Drink category';
    } else if (widget.type == 'ToGo') {
      _categoryName = 'Orders in To Go category';
    }
  }

  void getSum() {
    _restaurantTotal = 0;
    widget.cartItems.forEach((f) {
      _restaurantTotal = _restaurantTotal + f.price;
    });
  }

  @override
  void initState() {
    super.initState();
    changeCategoryName();
    getSum();
  }

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showHotel = !_showHotel;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '$_restaurantTotal Kč',
                        style: TextStyle(fontSize: 20),
                      ),
                      !_showHotel
                          ? Icon(Icons.arrow_drop_down)
                          : Icon(Icons.arrow_drop_up)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Divider(
          height: 5,
          color: Colors.black,
        ),
        _showHotel
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '${widget.cartItems[index].name}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                       setState(() {
                                         bloc.changeQuantity(index, false);
                                         getSum();
                                       });
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/icon_minus.svg')),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.cartItems[index].quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                       setState(() {
                                         bloc.changeQuantity(index, true);
                                         getSum();
                                       });
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/icon_plus.svg')),
                                ],
                              )
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${widget.cartItems[index].price} Kč',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            icon: Icon(Icons.delete_outline),
                            onPressed: () {
                              setState(() {
                                _restaurantTotal = _restaurantTotal -
                                    widget.cartItems[index].price;
                                bloc.clear(
                                  widget.cartItems[index].index,
                                );
                              });
                            }),
                      )
                    ],
                  );
                })
            : Container(),
        SizedBox(
          height: 20,
        ),
        NextStep(
          widgetToGo: CartScreenStep2(),
        ),
      ],
    );
  }
}
