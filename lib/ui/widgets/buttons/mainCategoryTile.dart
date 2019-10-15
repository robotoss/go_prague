import 'package:flutter/material.dart';

class MainCategoryTile extends StatefulWidget {
  final Color titleColor;
  final String name;

  MainCategoryTile({
    this.titleColor,
    this.name,

});

  @override
  _MainCategoryTileState createState() => _MainCategoryTileState();
}

class _MainCategoryTileState extends State<MainCategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: widget.titleColor
      ),
      child: Column(
        children: <Widget>[
          Text(
              widget.name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
