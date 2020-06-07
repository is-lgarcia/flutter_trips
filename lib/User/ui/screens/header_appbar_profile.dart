import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/User/ui/widgets/info_profile.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../../widgets/gradient_back_profile.dart';

class HeaderAppbarProfile extends StatelessWidget {

  User user;

  HeaderAppbarProfile(@required this.user);

  @override
  Widget build(BuildContext context) {

    return showProfileData(user);
  }

  Widget showProfileData(User snapshot){
      return Stack(
        children: <Widget>[
          GradientBackProfile("Perfil"),
          InfoProfile(user),
        ],
      );
    }
}
