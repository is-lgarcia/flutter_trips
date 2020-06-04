import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'Place/ui/screens/home_trip.dart';
import 'Place/ui/screens/search_trips.dart';
import 'User/ui/screens/profile_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

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
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                      child: ProfileTrips(),
                      bloc: UserBloc()
                  );
                },
              );
              break;
          }
        },
      ),
    );
  }

}