import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_prague/theme/mainTheme.dart';

class MainCategoryTile extends StatefulWidget {
  final Color titleColor;
  final String name;
  final String icon;
  final bool secondSide;
  final Widget navigateScreen;

  MainCategoryTile({
    this.titleColor,
    this.name,
    this.icon,
    this.secondSide,
    this.navigateScreen,

});

  @override
  _MainCategoryTileState createState() => _MainCategoryTileState();
}

class _MainCategoryTileState extends State<MainCategoryTile> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  bool isAnimated = true;

  int _statusButton = 0;





  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this,
        duration: new Duration(seconds: 1));
    Tween tween = new Tween<double>(begin: 0.0, end: 3.0);
    animation = tween.animate(controller);
    animation.addListener(() {
      setState(() {
      });
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(animation.value),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onTap: (){
           if(widget.secondSide){
             if(isAnimated) {
               isAnimated = false;
               controller.forward();
               Future.delayed(const Duration(milliseconds: 500), () {
                 setState(() {
                   _statusButton = 1;
                 });

               });

               Future.delayed(const Duration(seconds: 5), () {
                 controller.reverse();
                 isAnimated = true;
                 Future.delayed(const Duration(milliseconds: 500), () {
                   setState(() {
                     _statusButton = 0;
                   });

                 });
               });
             }
           }
          },
          child: Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: widget.titleColor
            ),
            child: _statusButton == 0 ? Column(
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
            ) : Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => widget.navigateScreen));
                  },
                  child: Container(
                    height: 70,
                    width: 120,
                    color: Colors.transparent,
                    child: Center(
                      child: Transform(  // Transform widget
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // perspective
                          ..rotateY(3.0),
                        alignment: FractionalOffset.center,
                        child: Text(
                          'In Hotel',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  width: 120,
                  color: widget.titleColor == ColorPalette().mainBlue ? ColorPalette().mainGreen : ColorPalette().mainBlue,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 70,
                    width: 120,
                    color: Colors.transparent,
                    child: Center(
                      child: Transform(  // Transform widget
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // perspective
                          ..rotateY(3.0),
                        alignment: FractionalOffset.center,
                        child: Text(
                          'In City',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
