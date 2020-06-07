import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/User/ui/widgets/boxbuttons.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'header_appbar_profile.dart';

class ProfileTrips extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        });

  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(snapshot == null || snapshot.hasError){
      print("Usuario no logeado");
      return Stack(
        children: <Widget>[
          Text("Usuario no logueado has login"),
        ],
      );
    }else{
      print("Logeado");
      var user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoUrl: snapshot.data.photoUrl, uid: snapshot.data.uid);
      return Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 300.0),
            child: Center(
                child: StreamBuilder(
                    stream: userBloc.myPlacesListStream(user.uid),
                    // ignore: missing_return
                    builder: (context, AsyncSnapshot snapshot){
                      switch(snapshot.connectionState){
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return CircularProgressIndicator();
                        case ConnectionState.active:
                        case ConnectionState.done:
                          return ListView(
                            children: userBloc.buildPlaces(snapshot.data.documents),
                          );
                      }
                    })
            ),
          ),
          HeaderAppbarProfile(user),
          BoxButtons(),
        ],
      );
    }
  }

}
