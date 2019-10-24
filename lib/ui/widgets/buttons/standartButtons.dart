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

class MoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 105,
      child: FlatButton(
          onPressed: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: ColorPalette().mainGreen,
          child: Text(
            'More',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}

class MoreBlueButton extends StatelessWidget {
  final Widget function;

  MoreBlueButton({this.function});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 82,
      child: FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => function));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: ColorPalette().mainBlue,
          child: Text(
            'More',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}

class AddToCartItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 143,
      child: FlatButton(
          onPressed: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: ColorPalette().mainGreen,
          child: Text(
            'Add to Cart',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}

class MeatButton extends StatelessWidget {
  final bool active;
  final String name;

  MeatButton({this.active, this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
//      width: 116,
      child: FlatButton(
          onPressed: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: active ? ColorPalette().mainGreen : ColorPalette().textLightDark,
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}