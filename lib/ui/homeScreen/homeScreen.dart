import 'package:flutter/material.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/data/repository.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/tours/tourInfoScreen/tourInfoScreen.dart';
import 'package:go_prague/ui/widgets/buttons/mainCategoryTile.dart';
import 'package:go_prague/ui/widgets/carousel/carousel.dart';

class HomeScreen extends StatelessWidget {
  static List<Widget> elements = List();
  static double carouselHeight = 160;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<List<ToursData>> getSlides(
    BuildContext context,
  ) async {
    List<ToursData> _listData;
    await Repository().accountTypes().then((toursList) {
      _listData = toursList;
      if(elements.isEmpty) {
        toursList.forEach((slide) {
          if(slide.mainScreen) {
            elements.add(carouselItem(context, slide, carouselHeight));
          }
        });
      }
    });
    return _listData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: customDrawer(context),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: new IconButton(icon: new Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: Text(
          'Welcome in Go.Prague',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 130,
            color: ColorPalette().mainBlack,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Text(
                  'Services',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 15,),
                      MainCategoryTile(titleColor: ColorPalette().mainGreen, name: 'Eat', icon: 'assets/icons/icon_main_eat.svg',),
                      MainCategoryTile(titleColor: ColorPalette().mainBlue, name: 'Drink', icon: 'assets/icons/icon_main_drink.svg',),
                      MainCategoryTile(titleColor: ColorPalette().mainGreen, name: 'To Go', icon: 'assets/icons/icon_main_go.svg',),
                      MainCategoryTile(titleColor: ColorPalette().mainBlue, name: 'Hotel Service', icon: 'assets/icons/icon_main_hotel_service.svg',),
                      MainCategoryTile(titleColor: ColorPalette().mainGreen, name: 'City Service', icon: 'assets/icons/icon_main_city_service.svg',),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget loadData(BuildContext context,  double carouselHeight){
  return Container(
    height: carouselHeight,
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

Widget carouselItem(BuildContext context, ToursData sliderData, double carouselHeight) {
  return Container(
    height: carouselHeight,
    width: MediaQuery.of(context).size.width,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
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
  );
}
