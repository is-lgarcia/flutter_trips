import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/User/ui/widgets/info_profile.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../../widgets/gradient_back_profile.dart';

class HeaderAppbarProfile extends StatelessWidget {
  UserBloc userBloc;
  User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) { // ignore: missing_return
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );

    /**/
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData && snapshot.hasError){
      print("Usuario no Logeado");
      return Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se puedo cargar la información. Haz Login")
          ],
        ),
      );
    }else{
      print("Logeado");
      print(snapshot);
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoUrl: snapshot.data.photoUrl);
      return Stack(
        children: <Widget>[
          GradientBackProfile("Perfil"),
          InfoProfile(user),
        ],
      );
    }
  }
}
