import 'package:flutter/material.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  return ThemeData(
    fontFamily: 'Montserrat',
//    appBarTheme: AppBarTheme(
//        brightness: Brightness.light,
//        iconTheme: IconThemeData(
//            color: Colors.black)
//    ),
//    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorPalette().mainBlack,
    scaffoldBackgroundColor: const Color(0xFFEFEFEF),
//    buttonColor: Color.fromRGBO(46, 38, 217, 1.0),
//    brightness: Brightness.light,
  );
}

class ColorPalette {
  var mainBlack = const Color(0xFF22252F); //Основной Тёмный цвет
  var mainGreen = const Color(0xFF14D2B8); //Основной Зелёный цвет
  var mainBlue = const Color(0xFF409CDE); //Основной Синий цвет
  var mainRed = const Color(0xFFEB5757); //Основной Красный цвет

  var textDark = const Color(0xFF535353); //Тёмный цвет текста
  var textLLDark = const Color(0xFF9B9B9B); //Светло цвет текста
  var textLightDark = const Color(0xFF828282); //Светло/Тёмный цвет текста

}