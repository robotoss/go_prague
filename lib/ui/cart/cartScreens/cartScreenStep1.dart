import 'package:flutter/material.dart';
import 'package:go_prague/data/bloc/cart_bloc.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:provider/provider.dart';

class CartScreenStep1 extends StatefulWidget {
  @override
  _CartScreenStep1State createState() => _CartScreenStep1State();
}

class _CartScreenStep1State extends State<CartScreenStep1> {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int _totalCount = 0;
    print(bloc.restaurantItems.length);
    if (bloc.restaurantItems.length > 0) {
      _totalCount = bloc.restaurantItems.length;
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 190,
            color: ColorPalette().mainBlack,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: double.infinity,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                        'Virtual Check-Out',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: Colors.white,)),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Step 1:',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white.withOpacity(0.7)
                          ),
                        ),
                        Text(
                          'Summary',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 5,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(const Radius.circular(10.0))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16,),
                      child: ListView.builder(
                          itemCount: _totalCount,
                          itemBuilder: (context,index){
                            RestaurantItem _restaurantItem = bloc.restaurantItems[index];
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 7,
                                  child: Text(
                                    _restaurantItem.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${_restaurantItem.price} Kč',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      icon: Icon(Icons.delete_outline),
                                      onPressed: (){
                                       setState(() {
                                         bloc.clear(_restaurantItem.type, index,);
                                       });
                                      }),
                                )
                              ],
                            );
                          }
                      ),
                    ),

                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
