import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/widgets/circle_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class BoxButtons extends StatelessWidget{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    return Container(
      margin: EdgeInsets.only(
        top: 220.0,
        left: 20.0
      ),
      child: Row(
        children: <Widget>[
          //cambiar comtraseña
          CircleButton(
                  () => {} , true, Icons.https, 20.0, Color.fromRGBO(255, 255, 255, 0.6)),
          //toma fotografía
          CircleButton(
                  () => {} , false, Icons.camera_alt, 40.0, Color.fromRGBO(255, 255, 255, 1)),
          //Salir de sesión
          CircleButton(
                  () => {
                    userBloc.SignOut()
                  } , true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6))
        ],
      ),
    );
  }

}