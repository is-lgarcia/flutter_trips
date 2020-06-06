import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen(
      {Key key, @required this.iconData, @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {


  /*bool isFav = false;
  *//*void onPressedFav() {
    setState(() {
      isFav = !isFav;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11da53),
      mini: true,
      heroTag: null,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),
    );
  }
}
