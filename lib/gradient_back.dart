import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradienteBack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268d3),
            Color(0xFF584cd1)
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),
    );
  }

}