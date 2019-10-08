import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome in Go.Prague',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Container(),
    );
  }
}
