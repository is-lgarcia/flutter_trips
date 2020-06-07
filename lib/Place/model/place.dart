import 'package:flutter/material.dart';
import 'package:fluttertrips/User/model/model_user.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  //User userOwner;

  Place(
      {Key key,
      @required this.name,
      @required this.description,
      @required this.urlImage,
      this.likes,
      //@required this.userOwner
      });
}
