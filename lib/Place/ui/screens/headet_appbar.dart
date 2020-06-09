import 'package:flutter/material.dart';
import 'package:fluttertrips/Place/ui/widgets/card_image_list.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HeaderAppBar extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){

            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return showPlaceData(snapshot);
          }
        });
  }

  Widget showPlaceData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[GradienteBack("Usuario no Logeado", 250.0)],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoUrl);

      return Stack(
        children: <Widget>[
          GradienteBack("Bienvenido", 250.0),
          CardImageList(user),
        ],
      );
    }
  }
}
