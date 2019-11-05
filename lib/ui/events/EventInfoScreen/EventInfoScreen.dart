import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/upcomingEvents.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/carousel/carousel.dart';
import 'package:go_prague/ui/widgets/selectAmount/selectAmount.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class EventInfoScreen extends StatefulWidget {
  final UpcomingEvents event;

  EventInfoScreen({
    this.event,
  });

  @override
  _EventInfoScreenState createState() => _EventInfoScreenState();
}

class _EventInfoScreenState extends State<EventInfoScreen> {

  static List<Widget> elements = List();




  @override
  void initState() {
    super.initState();

    if(widget.event.imgUrls != null){
      widget.event.imgUrls.forEach((image){
        elements.add(carouselItem(image));
      });
    }
  }


  @override
  void dispose() {
    elements.clear();
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
            color: ColorPalette().mainBlack,
            child: InfoCarousel(height: 300, elements: elements,),
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
                Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(const Radius.circular(5.0))
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.event.name,
                                softWrap: true,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Number of tourists',
                                    style: TextStyle(
                                      color: ColorPalette().textLLDark,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  SelectAmount(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 72,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${widget.event.startTime}',
                                    style: TextStyle(
                                        color: ColorPalette().textLLDark,
                                        fontSize: 19,
                                    ),
                                  ),
                                  Text(
                                    widget.event.price == 0 ? 'FREE' : '${widget.event.price} Kč',
                                    style: TextStyle(
                                        color: ColorPalette().textLLDark,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(const Radius.circular(5.0))
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: 320
                                ),
                                child: Text(
                                  widget.event.article,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: ColorPalette().textLLDark,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Place',
                                          style: TextStyle(
                                              color: ColorPalette().textLLDark,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                        Text(
                                          widget.event.place,
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    AddTicketToCartButton(addToCart: (){Provider.of<CartBloc>(context).addToCart(CartItem('ToGo', '', widget.event.name, [], widget.event.price,));},),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image,
      placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
    ),
  );
}

