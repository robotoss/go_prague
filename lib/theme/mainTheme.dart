import 'package:flutter/material.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  return ThemeData(
//    appBarTheme: AppBarTheme(
//        brightness: Brightness.light,
//        iconTheme: IconThemeData(
//            color: Colors.black)
//    ),
//    scaffoldBackgroundColor: Colors.white,
//    primaryColor: Color.fromRGBO(46, 38, 217, 1.0),
//    buttonColor: Color.fromRGBO(46, 38, 217, 1.0),
//    fontFamily: 'SFProText',
//    brightness: Brightness.light,
  );
}

class ColorPalette {
  var mainBlack = const Color(0xFF22252F); //Основной Тёмный цвет
  var mainGreen = const Color(0xFF14D2B8); //Основной Зелёный цвет
  var mainBlue = const Color(0xFF409CDE); //Основной Синий цвет

  var textDark = const Color(0xFF535353); //Тёмный цвет текста
  var textLightDark = const Color(0xFF828282); //Светло/Тёмный цвет текста

}