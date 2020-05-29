import 'package:flutter/material.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/Place/ui/widgets/card_image_list.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        GradienteBack("Bienvenido", 250.0),
        CardImageList(),
      ],
    );

  }

}