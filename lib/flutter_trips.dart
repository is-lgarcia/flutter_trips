import 'package:flutter/material.dart';
import 'package:fluttertrips/flutter_trips_cupertino.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/Place/ui/screens/home_trip.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/screens/profile_trips.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/Place/ui/screens/search_trips.dart';

class FlutterTrips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FlutterTrips();
  }
  
}

class _FlutterTrips extends State<FlutterTrips>{

  int indexTab = 0;
  final List<Widget> widgetsChildren = [
    Hometrips(),
    SearchTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index){
    setState(() {
      indexTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {





    return Scaffold(
        body: widgetsChildren[indexTab],
        bottomNavigationBar: FlutterTripsCupertino()


        /*Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.purple
          ),
          child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTab,
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
            ],
          ),
        ),*/
    );
  }
  
}