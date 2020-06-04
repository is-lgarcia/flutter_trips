import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradienteBack extends StatelessWidget{

  String title = "Popular";
  double height = 0.0;

  GradienteBack(this.title, this.height);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
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
      child: Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }

}