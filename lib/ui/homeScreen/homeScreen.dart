import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/data/models/upcomingEvents.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/bar/city/cityBarList.dart';
import 'package:go_prague/ui/bar/hotel/hotelBarList.dart';
import 'package:go_prague/ui/cart/cartScreens/cartScreenStep1.dart';
import 'package:go_prague/ui/events/eventsList.dart';
import 'package:go_prague/ui/restaurant/city/cityRestaurantList.dart';
import 'package:go_prague/ui/restaurant/hotel/hotelRestaurantList.dart';
import 'package:go_prague/ui/tours/tourInfoScreen/tourInfoScreen.dart';
import 'package:go_prague/ui/tours/toursList/toursListScreen.dart';
import 'package:go_prague/ui/widgets/buttons/mainCategoryTile.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';
import 'package:go_prague/ui/widgets/carousel/carousel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static List<Widget> elements = List();
  static double carouselHeight = 160;
  static List<UpcomingEvents> _events = List();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<List<ToursData>> getSlides(
    BuildContext context,
  ) async {
    List<ToursData> _listData;
    await Repository().accountTypes().then((toursList) {
      print('Количество туров - ${toursList.length}');
      _listData = toursList;
      if(elements.isEmpty) {
        toursList.forEach((slide) {
          slide.items.forEach((response){
            if(response.mainScreen) {
              elements.add(carouselItem(context, response, carouselHeight));
            }
          });
        });
      }
    }).catchError((error) {
      if (error is DioError) {
        print(error.message);
      } else {
        print(error.toString());
      }
    });
    return _listData;
  }

  Future<List<UpcomingEvents>> getEvents(
      BuildContext context,
      ) async {
    List<UpcomingEvents> _listData;
    List<UpcomingEvents> _listMainData = List();

    await Repository().upcomingEventsList().then((toursList) {
      print(1);
      _listData = toursList;
      _listData.forEach((f){
        if(f.mainScreen) {
          _listMainData.add(f);
        }
      });
      print(2);
    }).catchError((error) {
      if (error is DioError) {
        print(error.message);
      } else {
        print(error.toString());
      }
    });

    return _listMainData;
  }
  int _totalCount = 0;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);

    if (bloc.cartItems.length > 0) {
      _totalCount = bloc.cartItems.length;
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: customDrawer(context),
//      appBar: AppBar(
//        elevation: 0.0,
//        centerTitle: true,
//        leading: new IconButton(icon: new Icon(Icons.menu),
//            onPressed: () => _scaffoldKey.currentState.openDrawer()),
//        title: Text(
//          'Welcome in Go.Prague',
//          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.shopping_cart),
//            onPressed: () {
//            },
//          ),
//        ],
//      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 190,
            color: ColorPalette().mainBlack,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 15,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(icon: new Icon(Icons.menu, color: Colors.white, size: 30,),
                            onPressed: () => _scaffoldKey.currentState.openDrawer()),
                        Text(
                            'Welcome in Go.Prague',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700,color: Colors.white,)),
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
                  ),
                ],
              ),
              FutureBuilder(
                  future: getSlides(context),
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? MainCarousel(
                            elements: elements,
                            height: carouselHeight,
                          )
                        : loadData(context, carouselHeight);
                  }),

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 20),
                      child: Text(
                        'Services',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 27
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 15,),
                          MainCategoryTile(titleColor: ColorPalette().mainGreen, name: 'Eat', icon: 'assets/icons/icon_main_eat.svg', secondSide: true, navigateScreen: HotelRestaurantList(), secondNavigateScreen: CityRestaurantList(),),
                          MainCategoryTile(titleColor: ColorPalette().mainBlue, name: 'Drink', icon: 'assets/icons/icon_main_drink.svg', secondSide: true, navigateScreen: HotelBarList(), secondNavigateScreen: CityBarList(),),
                          MainCategoryTile(titleColor: ColorPalette().mainGreen, name: 'To Go', icon: 'assets/icons/icon_main_go.svg', secondSide: false, navigateScreen: ToursListScreen(),),
                          MainCategoryTile(titleColor: ColorPalette().mainBlue, name: 'Hotel Service', icon: 'assets/icons/icon_main_hotel_service.svg', secondSide: false,),
                          MainCategoryTile(titleColor: ColorPalette().mainGreen, name: 'City Service', icon: 'assets/icons/icon_main_city_service.svg', secondSide: false,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 205,
                width: double.infinity,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/images/special_background.jpg'),
                   fit: BoxFit.cover
                 )
               ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Find special for you?',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 45),
                    SizedBox(
                      height: 30,
                      width: 150,
                      child: FlatButton(
                          onPressed: () {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: ColorPalette().mainGreen,
                          child: Text(
                            'FIND',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Upcoming Events',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EventsList()));
                              },
                              child: Text(
                                'Show more...',
                                style: TextStyle(
                                  color: ColorPalette().textLightDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FutureBuilder(
                          future: getEvents(context),
                            builder: (context, snapshot) {
                            _events = snapshot.data;
                            return snapshot.data == null ? loadData(context, 115) :
                            Container(
                              height: 115,
                              width: double.infinity,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _events.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        width: 345,
                                        height: 120,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              height: 115,
                                              width: 115,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(6)),
                                                color: ColorPalette().mainBlack,
                                                image: DecorationImage(
                                                  image: CachedNetworkImageProvider(_events[index].imgUrls[0]),
                                                  fit: BoxFit.cover
                                                )
                                              ),
                                            ),
                                            SizedBox(
                                              width: 215,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    _events[index].name,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 24
                                                    ),
                                                  ),
                                                  Text(
                                                      _events[index].article,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: ColorPalette().textLightDark
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                          '${_events[index].price} Kč',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                      MoreButton(),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            );
                            }
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget loadData(BuildContext context,  double itemHeight){
  return Container(
    height: itemHeight,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget customDrawer(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/demo_dawer_bg.jpg'),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 200,
                      color: Colors.green,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.notification_important, color: Colors.white,),
                          Text(
                            'You have: ',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          Text(
                            '0 notification',
                            style: TextStyle(
                                color: Colors.white,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Hello,',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 38,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                        ),
                        child: Center(
                          child: Text(
                            'NS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'mr. Novikov \nSergey',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 38,

                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Language',
                  style: TextStyle(
                    color: ColorPalette().textLightDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  'English',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Currency',
                  style: TextStyle(
                      color: ColorPalette().textLightDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  'Kč',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'About',
                  style: TextStyle(
                      color: ColorPalette().textLightDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(width: 10)
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 230,
                height: 60,
                child: FlatButton(
                  onPressed: (){},
                  color: ColorPalette().mainRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    'Emergency Call',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25,)
        ],
      ),
    ),
  );
}

Widget carouselItem(BuildContext context, ItemTourData sliderData, double carouselHeight) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => TourInfoScreen(tourData: sliderData,)));
    },
    child: Container(
      height: carouselHeight,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  sliderData.imgUrls[0],
                ),
                fit: BoxFit.cover)),
        child: Container(
          color: Colors.black.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  sliderData.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
              ),
//            SizedBox(
//              height: 40,
//            ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: SizedBox(
                  height: 30,
                  width: 150,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TourInfoScreen(tourData: sliderData,)));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: ColorPalette().mainGreen,
                      child: Text(
                        'GO',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
