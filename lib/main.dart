import 'package:flutter/material.dart';
import 'package:go_prague/ui/homeScreen/homeScreen.dart';

import 'theme/mainTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
