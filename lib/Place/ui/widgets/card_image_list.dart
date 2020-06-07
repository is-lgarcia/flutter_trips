import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CardImageList extends StatelessWidget{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 350.0,
      child: StreamBuilder(
          stream: userBloc.placesStream,
          // ignore: missing_return
          builder: (context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return ListView(
                  padding: EdgeInsets.all(25.0),
                  scrollDirection: Axis.horizontal,
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
              default:
            }
          }),
    );
  }

}