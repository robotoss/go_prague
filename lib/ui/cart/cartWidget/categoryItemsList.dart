import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep2.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:provider/provider.dart';


class ListItemsInCart extends StatefulWidget {
  final List<CartItem> allCartItems;
  final String placeName;
  final String type;

  ListItemsInCart({
    this.allCartItems,
    this.placeName,
    this.type,
  });

  @override
  _ListItemsInCartState createState() => _ListItemsInCartState();
}

class _ListItemsInCartState extends State<ListItemsInCart> {
  bool _showFullInfo = false;
  int _restaurantTotal = 0;
  List<CartItem> cartItems = List();

  bool filterData = true;

  void getSum() {
    _restaurantTotal = 0;
   cartItems.forEach((f) {
      _restaurantTotal = _restaurantTotal + f.price;
    });
  }


  @override
  void initState() {
    super.initState();

    if(filterData){
      if (widget.type == 'eat') {
        Provider.of<CartBloc>(context, listen: false).eatItems.forEach((f){
          if(f.placeName == widget.placeName){
            cartItems.add(f);
          }
        });
        filterData = false;
      } else if (widget.type == 'drink') {
        Provider.of<CartBloc>(context, listen: false).drinkItems.forEach((f){
          if(f.placeName == widget.placeName){
            cartItems.add(f);
          }
        });
      } else if (widget.type == 'togo') {
        Provider.of<CartBloc>(context, listen: false).toGoItems.forEach((f){
          if(f.placeName == widget.placeName){
            cartItems.add(f);
          }
        });
      }
    }
    getSum();
    print('HOW_MUCH_LENG_PARENT - ${Provider.of<CartBloc>(context, listen: false).eatItems.length}');
    print('HOW_MUCH_LENG_PARENT - ${cartItems.length}');
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 35,),
        cartItems[0].placeName != '' ? Text(
          cartItems[0].placeName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700
          ),
        ) : Container(),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showFullInfo = !_showFullInfo;
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '$_restaurantTotal Kč',
                        style: TextStyle(fontSize: 20),
                      ),
                      !_showFullInfo
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
        _showFullInfo
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                          flex: 7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Text(
                                  '${cartItems[index].name}',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          bloc.changeQuantity(cartItems[index].index, false);
                                          getSum();
                                        });
                                      },
                                    child: Icon(Icons.remove_circle, color: Colors.black12,),
//                                      child: SvgPicture.asset(
//                                          'assets/icons/icon_minus.svg')
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    cartItems[index].quantity.toString(),
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
                                          print('INDEX_FOR_DELETE - ${cartItems[index].index}');
                                          bloc.changeQuantity(cartItems[index].index, true);
                                          getSum();
                                        });
                                      },
                                    child: Icon(Icons.add_circle, color: ColorPalette().mainGreen.withOpacity(0.7),),
//                                      child: SvgPicture.asset(
//                                          'assets/icons/icon_plus.svg')
                                          ),
                                ],
                              )
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${cartItems[index].price} Kč',
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
                            cartItems.removeAt(index);
                            _restaurantTotal = _restaurantTotal -
                                widget.allCartItems[index].price;
                            bloc.clear(
                              widget.allCartItems[index].index,
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
          widgetToGo: CartScreenStep2(cartItems: cartItems, restaurantTotal: _restaurantTotal,),
        ),
      ],
    );
  }
}
