import 'package:flutter/material.dart';
import 'package:go_prague/theme/mainTheme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Welcome in Go.Prague',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 130,
            color: ColorPalette().mainBlack,
            child: Text(
              '123',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}
