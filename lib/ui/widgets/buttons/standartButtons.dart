import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:provider/provider.dart';

class AddTicketToCartButton extends StatelessWidget {
  final Function addToCart;

  AddTicketToCartButton({this.addToCart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 55),
        child: FlatButton(
            onPressed: () {
              addToCart();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: ColorPalette().mainGreen,
            child: Text(
              'Add Ticket to Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final Function addToCart;

  AddToCartButton({this.addToCart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 55),
        child: FlatButton(
            onPressed: () {
              addToCart();
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
  final Widget widget;

  MoreButton({this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 105,
      child: FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
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
  final Widget widget;

  MoreBlueButton({this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 170,
      child: FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: ColorPalette().mainBlue,
          child: Text(
            'More',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}

class OpenMenuBlueButton extends StatelessWidget {
  final Widget function;

  OpenMenuBlueButton({this.function});
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
            'Open Menu',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}

class AddToCartItemButton extends StatelessWidget {
  final Function addToCart;

  AddToCartItemButton({this.addToCart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 143,
      child: FlatButton(
          onPressed: () {
            addToCart();
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

class AddToCartItemButtonMini extends StatelessWidget {
  final CartItem item;

  AddToCartItemButtonMini({this.item});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);

    return SizedBox(
      height: 30,
      width: 104,
      child: FlatButton(
        padding: EdgeInsets.all(1),
          onPressed: () {
            bloc.addToCart(item);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: ColorPalette().mainGreen,
          child: Text(
            'Add to Cart',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}

class MeatButton extends StatelessWidget {
  final int index;
  final String name;
  final String activeItem;
  final Function changeActiveFunc;

  MeatButton({this.index, this.name, this.activeItem, this.changeActiveFunc});


  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 30,
//      width: 116,
      child: FlatButton(
          onPressed: () {
            changeActiveFunc(index, name);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: name == activeItem ? ColorPalette().mainGreen : ColorPalette().textLightDark,
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