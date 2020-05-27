import 'package:flutter/material.dart';

class ButtonProfileFab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonProfileFab();
  }

}

class _ButtonProfileFab extends State<ButtonProfileFab>{

  bool isFav = false;

  void onPressedFav(){
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: FloatingActionButton(
        backgroundColor: isFav? Color(0xFFffffff) : Color(0xFFa8b2e5),
        mini: true,
        tooltip: "Fav",
        onPressed: onPressedFav,
        child: Icon(
          Icons.person,
          color: Color(0xFF4268d3),
        ),
      ),
    );

  }
}