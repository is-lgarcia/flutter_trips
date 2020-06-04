import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {

  final VoidCallback onPressed;
  bool mini;
  var icon;
  double iconSize;
  var color;


  CircleButton(@required this.onPressed, this.mini, this.icon, this.iconSize, this.color);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {



  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
            onPressed: widget.onPressed,
          backgroundColor: widget.color,
          mini: widget.mini,
          heroTag: null,
          child: Icon(
              widget.icon,
            size: widget.iconSize,
            color: Color(0xFF4268d3),
          ),
        )
    );
  }
}
