import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/Place/model/place.dart';
import 'package:fluttertrips/Place/ui/widgets/title_input_location.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/widgets/button_purple.dart';
import 'package:fluttertrips/widgets/floating_action_button_green.dart';
import 'package:fluttertrips/widgets/gradient_back.dart';
import 'package:fluttertrips/widgets/text_input.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File _image;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    _imageFile = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(_imageFile.path);
    });
  }

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
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment(0.9, 1.0),
                    children: <Widget>[
                      Container(
                          height: 250.0,
                          width: 350.0,
                          margin: EdgeInsets.only(bottom: 20.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 15.0,
                                    offset: Offset(0.0, 7.0))
                              ]),
                          child: _image == null
                              ? Text(
                                  "No hay imagen Seleccionada",
                                  textAlign: TextAlign.center,
                                )
                              : Image.file(_image)),
                      FloatingActionButtonGreen(
                          iconData: Icons.add_a_photo, onPressed: getImage)
                    ],
                    /*child: CardImageWithFabIcon(
                        pathImage: "assets/images/beach.jpg",
                        width: 350.0,
                        height: 250.0,
                        onPressFabIcon: null,
                        iconData: Icons.camera_alt,
                        left: 0.0),*/
                    //FOTO
                  ),
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
                        //ID del usuario logueado Actualmente,

                        userBloc.currentUser.then((value) {
                          String uid;
                          if (value != null) {
                            uid = value.uid;
                            String path =
                                "$uid/${DateTime.now().toString()}.jpg";
                            String urlImage;
                            //subiendo
                            userBloc.uploadFile(path, _image).then((value) {
                              value.onComplete.then((value) => value.ref
                                  .getDownloadURL()
                                  .then((value) {
                                    print("URLIMAGE: $value");
                                    urlImage = value;
                                    //ColudFirestore
                                    //Place title, description, url, userOwner, likes
                                    userBloc
                                        .updatePlaceData(Place(
                                      name: _controllerTitlePlace.text,
                                      description: _controllerDescriptionPlace.text,
                                      likes: 0,
                                      urlImage: urlImage,
                                    ))
                                        .whenComplete(() {
                                      print("TERMINO...");
                                      Navigator.pop(context);
                                    });
                              }));
                            });
                          }
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
