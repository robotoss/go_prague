import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_prague/data/models/upcomingEvents.dart';
import 'package:go_prague/theme/mainTheme.dart';
import 'package:go_prague/ui/events/EventInfoScreen/EventInfoScreen.dart';
import 'package:go_prague/ui/widgets/buttons/standartButtons.dart';

class EventCard extends StatelessWidget {
  final UpcomingEvents event;

  EventCard({this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => EventInfoScreen(event: event,)));
        },
        child: Card(
          child: Container(
            height: 250,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 125,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: event.imgUrls[0],
                    placeholder: (context, url) => Image.asset('assets/images/special_background.png', fit: BoxFit.cover,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        event.name,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        event.article,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorPalette().textLightDark
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '${event.startTime}',
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '${event.price} Kč',
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorPalette().textLightDark
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          MoreBlueButtonBig(widget:  EventInfoScreen(event: event,),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
