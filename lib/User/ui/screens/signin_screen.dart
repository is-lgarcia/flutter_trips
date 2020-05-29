import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/flutter_trips.dart';
import 'package:fluttertrips/widgets/button_green.dart';
import 'package:fluttertrips/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //snapshot tiene nuestro objeto user traido de firebase.

        if(snapshot.hasData){
          return FlutterTrips();
        } else if(snapshot.hasError){
          return Text("Ocurrio un error en la transmisión de datos");
        } else if (snapshot.connectionState != ConnectionState.waiting){
          return signinGoogleUI();
        }else {
          return progressbar;
        }

      },
    );
  }

  final progressbar = Container(
    color: Colors.white,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.0,
          width: 70.0,
          child: CircularProgressIndicator(
            backgroundColor: Colors.cyan[400],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("C a r g a n d o . . .",
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 22,
                fontFamily: "Lato",
                decoration: TextDecoration.none
            ),),
        )
      ],
    ),
  );

  Widget signinGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradienteBack("", MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bienvenido \nA tu aplicación de viajes",
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
              ButtonGreen(text: "Iniciar Sesión con Gmail",
                onPressed: (){
                //Logica donde hacemos el signin
                userBloc.signIn().then((value) => print("El usuario es ${value.displayName}"));
              },
                width: 300.0,
                heigth: 50.0,
              ),
            ],
          )
        ],
      ),
    );
  }

}
