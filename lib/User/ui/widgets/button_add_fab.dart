import 'package:flutter/material.dart';

class ButtonAddFab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonAddFab();
  }

}

class _ButtonAddFab extends State<ButtonAddFab>{

  bool isFav = true;

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
        mini: false,
        tooltip: "Fav",
        onPressed: onPressedFav,
        child: Icon(
          Icons.add,
          color: Color(0xFF4268d3),
          size: 50.0,
        ),
      ),
    );

  }
}