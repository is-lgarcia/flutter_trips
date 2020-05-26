import 'package:flutter/material.dart';

class ButtonMessageFab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonMessageFab();
  }

}

class _ButtonMessageFab extends State<ButtonMessageFab>{

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
          Icons.email,
          color: Color(0xFF4268d3),
        ),
      ),
    );

  }
}