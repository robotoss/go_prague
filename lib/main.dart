import 'package:flutter/material.dart';
import 'package:go_prague/ui/homeScreen/homeScreen.dart';
import 'package:provider/provider.dart';

import 'data/bloc/cart_bloc.dart';
import 'theme/mainTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
      builder: (context) => CartBloc(),
      child: MaterialApp(
        theme: defaultTheme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}


