import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/Place/model/place.dart';
import 'package:fluttertrips/Place/ui/widgets/card_image.dart';
import 'package:fluttertrips/Place/ui/widgets/title_input_location.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/widgets/button_purple.dart';
import 'package:fluttertrips/widgets/gradient_back.dart';
import 'package:fluttertrips/widgets/text_input.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradienteBack("Agregar una nuevo lugar", 300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                      pathImage: "assets/images/beach.jpg",
                      width: 350.0,
                      height: 250.0,
                      onPressFabIcon: null,
                      iconData: Icons.camera_alt,
                      left: 0.0),
                  //FOTO
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                      hintText: "Título",
                      inputType: null,
                      controller: _controllerTitlePlace),
                ),
                TextInput(
                  hintText: "Descripción",
                  inputType: TextInputType.multiline,
                  controller: _controllerDescriptionPlace,
                  maxLines: 4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TitleInputLocation(
                    hintText: "Agregar Ubicación",
                    iconData: Icons.location_on,
                    controller: null,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                      buttonText: "Agregar Lugar",
                      onPressed: () {
                        //FireStorage
                        //UrlImage
                        //ColudFirestore
                        //Place title, description, url, userOwner, likes
                        userBloc
                            .updatePlaceData(Place(
                                name: _controllerTitlePlace.text,
                                description: _controllerDescriptionPlace.text,
                                urlImage: null,
                                userOwner: null,
                                likes: 0))
                            .whenComplete(() {
                          print("TERMINO");
                          Navigator.pop(context);
                        });
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
