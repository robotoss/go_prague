import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/cityRestaurantItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/selectAmount/selectAmount.dart';
import 'package:provider/provider.dart';

class CityProductInfoScreen extends StatefulWidget {
  final CategoryItem categoryItem;
  final String restaurantName;

  CityProductInfoScreen({
    this.categoryItem,
    this.restaurantName,
  });

  @override
  _CityProductInfoScreenState createState() => _CityProductInfoScreenState();
}

class _CityProductInfoScreenState extends State<CityProductInfoScreen> {

  Map<int, String> activeOption = Map();

  void optionsChose(int numberItem, String activeOptions) {
    print('Кнопка сработала');
    setState(() {
      activeOption.update(numberItem, (value) => activeOptions);
    });
  }

  @override
  void initState() {
    super.initState();
    if(activeOption != null) {
      widget.categoryItem.parametrs.forEach((f){
        activeOption[f.parametrId] = f.parametrsItems[0];
      });
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int _totalCount = 0;
    print(bloc.cartItems.length);
    if (bloc.cartItems.length > 0) {
      _totalCount = bloc.cartItems.length;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            color: ColorPalette().mainBlack,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.categoryItem.imageUrl,
              placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.white, size: 30,),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreenStep1()));
                        },
                      ),
                      Positioned(
                          top: 3.0,
                          right: 7,
                          child: new Center(
                            child: new Text(
                              '$_totalCount',
                              style: new TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                SizedBox(height: 255),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(const Radius.circular(10.0))
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.categoryItem.itemName,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.categoryItem.price.toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Kč',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Divider(height: 1, color: ColorPalette().textLightDark,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              widget.categoryItem.description,
                              maxLines: 4,
                              style: TextStyle(
                                color: ColorPalette().textLightDark,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Divider(height: 1, color: ColorPalette().textLightDark,),
                          widget.categoryItem.parametrs.length != 0 ? Column(
                              children: List<Widget>.generate(widget.categoryItem.parametrs.length, (int index){
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        widget.categoryItem.parametrs[index]
                                            .parametrName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                            ColorPalette().textLightDark),
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        alignment: WrapAlignment.end,
                                        crossAxisAlignment: WrapCrossAlignment.end,
                                        spacing: 5.0, // gap between adjacent chips
                                        runSpacing: 5.0, // gap between lines
                                        children: List<Widget>.generate(widget.categoryItem.parametrs[index].parametrsItems.length, (int i){
//                                          return MeatButton(active: false, name: widget.categoryItem.parametrs[index].parametrsItems[i],);
                                          return SizedBox(
                                            height: 30,
//      width: 116,
                                            child: FlatButton(
                                                onPressed: () {
                                                  setState(() {
                                                    activeOption.update(index, (value) => widget.categoryItem.parametrs[index].parametrsItems[i]);
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                color: widget.categoryItem.parametrs[index].parametrsItems[i] == activeOption[index] ? ColorPalette().mainGreen : ColorPalette().textLightDark,
                                                child: Text(
                                                  widget.categoryItem.parametrs[index].parametrsItems[i],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w700),
                                                )),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          ) : Container(),
                          Divider(height: 1, color: ColorPalette().textLightDark,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.access_time),
                                        SizedBox(width: 5),
                                        Text(
                                          widget.categoryItem.cookTime.toString(),
                                          style: TextStyle(
                                              fontSize: 22
                                          ),
                                        ),
                                        Text(
                                          ' min',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Quantity',
                                          style: TextStyle(
                                              fontSize: 18
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        SelectAmount(),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 35),
                                  child: AddToCartButton(addToCart:  (){Provider.of<CartBloc>(context).addToCart(CartItem(0, 'eat', widget.restaurantName, widget.categoryItem.itemName, [], widget.categoryItem.price,));},),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget carouselItem(String image) {
  return Container(
    height: 300,
    width: double.infinity,
    child: Image.network(image, fit: BoxFit.cover,),
  );
}

