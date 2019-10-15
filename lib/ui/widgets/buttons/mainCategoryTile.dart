import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainCategoryTile extends StatefulWidget {
  final Color titleColor;
  final String name;
  final String icon;

  MainCategoryTile({
    this.titleColor,
    this.name,
    this.icon,

});

  @override
  _MainCategoryTileState createState() => _MainCategoryTileState();
}

class _MainCategoryTileState extends State<MainCategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: widget.titleColor
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            SvgPicture.asset(widget.icon),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                  widget.name,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
