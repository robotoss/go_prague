import 'package:flutter/material.dart';
import 'package:go_prague/theme/mainTheme.dart';

class AddToCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 55),
        child: FlatButton(
            onPressed: () {
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: ColorPalette().mainGreen,
            child: Text(
              'Add to cart',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}
