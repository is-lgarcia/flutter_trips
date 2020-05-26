import 'package:flutter/material.dart';

class GradientBackProfile extends StatelessWidget{

  String title = "Popular";

  GradientBackProfile(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.0,
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
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
        ),
      ),
      alignment: Alignment(-0.9, -0.8)
    );
  }
}