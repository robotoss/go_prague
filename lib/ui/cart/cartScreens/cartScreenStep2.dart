import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:provider/provider.dart';

import 'cartScreenStep3.dart';



class CartScreenStep2 extends StatefulWidget {
  final List<CartItem> cartItems;
  final int restaurantTotal;

  CartScreenStep2({this.cartItems, this.restaurantTotal});

  @override
  _CartScreenStep2State createState() => _CartScreenStep2State();
}

class _CartScreenStep2State extends State<CartScreenStep2> {

  String _type = 'Pick-Up';
  String _time = 'Now';
  String _paymentMetod = 'Cash';
  String _partySize = '1';

  bool active = false;

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerSurname = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerMessenger = TextEditingController();
  TextEditingController _controllerComment = TextEditingController();


  @override
  void initState() {
    _controllerName.addListener((){
      if(_controllerName.text != '' && _controllerPhone .text != ''){

       setState(() {
         active = true;
       });
      } else {
        setState(() {
          print('ALL_FORM_NO_CORECT');
          print(_controllerName.text);
          print(_controllerPhone.text);
          active = false;
        });
      }
    });
    _controllerPhone.addListener((){
      if(_controllerName.text != '' &&_controllerPhone .text != ''){
        print('ALL_FORM_CORECT');
        setState(() {
          bool active = true;
        });
      } else {
        setState(() {
          print('ALL_FORM_NO_CORECT');
          print(_controllerName.text);
          print(_controllerPhone.text);
          bool active = false;
        });
      }
    });

    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    _controllerName.dispose();
    _controllerSurname.dispose();
    _controllerPhone.dispose();
    _controllerMessenger.dispose();
    _controllerComment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 190,
            color: ColorPalette().mainBlack,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child:  Column(
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
                            Navigator.pop(context);
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
                              'Step 2:',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white.withOpacity(0.7)
                              ),
                            ),
                            Text(
                              'Order confirmation',
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
                                color: Colors.white.withOpacity(0.4),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListView(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      widget.cartItems[0].placeName,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.delete_outline),
                                        onPressed: () {
                                          setState(() {
                                            widget.cartItems.forEach((f){
                                              bloc.clear(
                                                f.index,
                                              );
                                            });
                                            Navigator.pop(context);
                                          });
                                        }),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Total',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      '${widget.restaurantTotal} Kč',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Order Info',
                                  style: TextStyle(
                                      fontSize: 24
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                standardForm('Name:*', _controllerName),

                                SizedBox(
                                  height: 5,
                                ),
                                standardForm('Surname:', _controllerSurname),

                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Choose a type',
                                      style: TextStyle(
                                        color: ColorPalette().textLightDark,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: ColorPalette().mainGreen,
                                      ),
                                      child: DropdownButton<String>(
                                        items: <String>[
                                          'Pick-Up',
                                          'Delivery',
                                          'In Place',
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _type = value;
                                          });
                                        },
                                        hint: Text(
                                          _type,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: ColorPalette().textDark),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Choose a time',
                                      style: TextStyle(
                                        color: ColorPalette().textLightDark,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: ColorPalette().mainGreen,
                                      ),
                                      child: DropdownButton<String>(
                                        items: <String>[
                                          'Now',
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _time = value;
                                          });
                                        },
                                        hint: Text(
                                          _time,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: ColorPalette().textDark),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Payment method',
                                      style: TextStyle(
                                        color: ColorPalette().textLightDark,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: ColorPalette().mainGreen,
                                      ),
                                      child: DropdownButton<String>(
                                        items: <String>[
                                          'Cash',
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _paymentMetod = value;
                                          });
                                        },
                                        hint: Text(
                                          _paymentMetod,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: ColorPalette().textDark),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Party size',
                                      style: TextStyle(
                                        color: ColorPalette().textLightDark,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: ColorPalette().mainGreen,
                                      ),
                                      child: DropdownButton<String>(
                                        items: <String>[
                                          '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25',
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _partySize = value;
                                          });
                                        },
                                        hint: Text(
                                          _partySize,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: ColorPalette().textDark),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                standardForm('Phone to Contact:*', _controllerPhone),
                                SizedBox(
                                  height: 5,
                                ),
                                standardForm('Any messenger to Contact:', _controllerMessenger),
                                SizedBox(
                                  height: 5,
                                ),
                                standardForm('Leave a comment:', _controllerComment),
                                SizedBox(
                                  height: 5,
                                ),

                            SizedBox(
                              height: 49,
                              width: double.infinity,
                              child: FlatButton(
                                  onPressed: active ? () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreenStep3()));
                                    widget.cartItems.forEach((f){
                                      bloc.clear(
                                        f.index,
                                      );
                                    });
                                  } : (){},
                                  splashColor: active ? Colors.transparent : ColorPalette().mainBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: active ? ColorPalette().mainBlue : ColorPalette().mainBlue.withOpacity(0.5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Next Step',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Icon(Icons.chevron_right, color: Colors.white, size: 40,)
                                    ],
                                  )
                              ),
                            ),
                              ],
                            ),
                          )

                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget standardForm(String name, TextEditingController controller) {
  return TextField(
    controller: controller,
    autocorrect: false,
    style: TextStyle(
      fontFamily: 'SFProDisplay',
      fontWeight: FontWeight.w700,
      fontSize: 17,
    ),
    decoration: InputDecoration(
      labelText: name,
      contentPadding:
      const EdgeInsets
          .symmetric(
          vertical: 15.0,
          horizontal: 14),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 13,
      ),

    ),
  );
}