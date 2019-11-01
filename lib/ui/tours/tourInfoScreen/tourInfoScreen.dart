import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/carousel/carousel.dart';
import 'package:go_prague/ui/widgets/selectAmount/selectAmount.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class TourInfoScreen extends StatefulWidget {
  final ItemTourData tourData;

  TourInfoScreen({
    this.tourData,
  });

  @override
  _TourInfoScreenState createState() => _TourInfoScreenState();
}

class _TourInfoScreenState extends State<TourInfoScreen> {

  static List<Widget> elements = List();
  String _date = 'Select day';
  String _time = 'Select time';

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date = DateFormat.yMMMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay response = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (response != null && response != selectedTime) {
      setState(() {
        selectedTime = response;
        _time = selectedTime.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    widget.tourData.imgUrls.forEach((image){
      elements.add(carouselItem(image));
    });
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
    print(bloc.restaurantItems.length);
    if (bloc.restaurantItems.length > 0) {
      _totalCount = bloc.restaurantItems.length + bloc.barItems.length + bloc.tourItems.length;
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
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.tourData.name,
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
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 72,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      '${widget.tourData.duration}',
                                    style: TextStyle(
                                      color: ColorPalette().textLLDark,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    widget.tourData.price == 0 ? 'FREE' : '${widget.tourData.price} Kč',
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
                                  minHeight: 250
                                ),
                                child: Text(
                                  widget.tourData.article,
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
                                          'Select a day',
                                          style: TextStyle(
                                            color: ColorPalette().textLLDark,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            _selectDate(context);
                                          },
                                          child: Text(
                                              _date,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Select a time',
                                          style: TextStyle(
                                              color: ColorPalette().textLLDark,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                GestureDetector(
                                  onTap: (){
                                    _selectTime(context);
                                  },
                                  child: Text(
                                    _time,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    AddToCartButton(addToCart: (){Provider.of<CartBloc>(context).addToCartTour(TourItem(widget.tourData.name, widget.tourData.price, 'Tour'));},),
                                    SizedBox(height: 5,)
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

