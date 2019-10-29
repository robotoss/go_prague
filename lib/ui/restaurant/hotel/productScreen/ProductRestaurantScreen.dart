import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/hotelRestaurantItems.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/selectAmount/selectAmount.dart';

class ProductRestaurantScreen extends StatefulWidget {
  final CategoryItem categoryItem;

  ProductRestaurantScreen({
    this.categoryItem,
  });

  @override
  _ProductRestaurantScreenState createState() => _ProductRestaurantScreenState();
}

class _ProductRestaurantScreenState extends State<ProductRestaurantScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white,),
                    onPressed: () {
                    },
                  ),
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
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: widget.categoryItem.parametrs.length,
                              itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                        widget.categoryItem.parametrs[index].parametrName,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorPalette().textLightDark
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 30,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: widget.categoryItem.parametrs[index].parametrsItems.length,
                                            itemBuilder: (context,i) {
                                              return MeatButton(active: false, name: widget.categoryItem.parametrs[index].parametrsItems[i],);
                                            }
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                              }),
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
                                  child: AddToCartButton(),
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

