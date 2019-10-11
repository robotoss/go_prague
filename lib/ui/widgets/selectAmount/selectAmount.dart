import 'package:flutter/material.dart';
import 'package:go_prague/theme/mainTheme.dart';

class SelectAmount extends StatefulWidget {
  @override
  _SelectAmountState createState() => _SelectAmountState();
}

class _SelectAmountState extends State<SelectAmount> {
  int _int = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 115,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette().mainGreen),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
             setState(() {
              if(_int > 1){
                _int = --_int;
              }
             });
            },
            child: Container(
              width: 40,
              height: 35,
              child:  Icon(Icons.remove, color: ColorPalette().mainGreen,),
            ),
          ),
          Text(
            _int.toString(),
            style: TextStyle(
              color: ColorPalette().textLightDark,
              fontSize: 18
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                _int = ++_int;
              });
            },
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                color: ColorPalette().mainGreen,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
              ),
              child:  Icon(Icons.add, color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}