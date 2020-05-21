import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertrips/home_trip.dart';
import 'package:fluttertrips/profile_trips.dart';
import 'package:fluttertrips/search_trips.dart';

class FlutterTripsCupertino extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            activeColor: Colors.indigo,
            backgroundColor: Color(0x33FFFFFF),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text("")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("")
            ),
          ]
        ),

        // ignore: missing_return
        tabBuilder: (BuildContext context, int index){
          switch(index){
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => Hometrips(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => ProfileTrips(),
              );
              break;
          }
        },
      ),
    );
  }

}