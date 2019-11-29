import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/homeScreen/homeScreen.dart';

import 'cartScreenStep1.dart';

class CartScreenStep3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 190,
            color: ColorPalette().mainBlack,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: double.infinity,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreenStep1()));
                      },
                    ),
                    Text(
                        'Virtual Check-Out',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: Colors.white,)),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Step 3:',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white.withOpacity(0.7)
                          ),
                        ),
                        Text(
                          'All Done',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white,
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(const Radius.circular(10.0))
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 100,),
                            SvgPicture.asset('assets/icons/mdi_done.svg'),
                            SizedBox(height: 5,),
                            Text(
                              'Congrats! Your order has been sent',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24
                              ),
                            ),
                            SizedBox(height: 114,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 257,
                                  height: 50,
                                  child: FlatButton(
                                    color: ColorPalette().mainBlue,
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreenStep1()));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.arrow_back, color: Colors.white, size: 28,),
                                        SizedBox(width: 20,),
                                        Text(
                                          'Back to Cart',
                                          style: TextStyle(
                                              fontSize:  27,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                ),
                                SizedBox(
                                  width: 257,
                                  height: 50,
                                  child: FlatButton(
                                      color: ColorPalette().mainBlue,
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[

                                          Text(
                                            'Go to Main',
                                            style: TextStyle(
                                                fontSize:  27,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                          Icon(Icons.arrow_forward, color: Colors.white, size: 28,),

                                        ],
                                      )
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
