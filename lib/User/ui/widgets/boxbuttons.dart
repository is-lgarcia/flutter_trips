import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/button_add_fab.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/button_mark_fab.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/button_message_fab.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/button_profile_fab.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/User/ui/widgets/button_tv_fab.dart';

class BoxButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 220.0,
        left: 20.0
      ),
      child: Row(
        children: <Widget>[
          ButtonMarkFab(),
          ButtonTVFab(),
          ButtonAddFab(),
          ButtonMessageFab(),
          ButtonProfileFab(),
        ],
      ),
    );
  }

}