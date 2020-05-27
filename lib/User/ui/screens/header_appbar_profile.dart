import 'package:flutter/material.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/widgets/gradient_back.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/info_profile.dart';

import '../../../widgets/gradient_back_profile.dart';

class HeaderAppbarProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBackProfile("Perfil"),
        InfoProfile(),
      ],
    );
  }

}