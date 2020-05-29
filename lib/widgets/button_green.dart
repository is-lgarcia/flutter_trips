import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {

  double width = 0.0;
  double heigth = 0.0;
  String text = "";
  VoidCallback onPressed;

  ButtonGreen({Key key, @required this.text, @required this.onPressed, this.width, this.heigth});

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        height: widget.heigth,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFa7ff84),  //Arriba
                  Color(0xFF1cbb78)   //Abajo
                ],
                begin: FractionalOffset(0.2,0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 3.0)
            )
          ]
        ),

        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 19.0,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
        ),

      ),
    );
  }
}
