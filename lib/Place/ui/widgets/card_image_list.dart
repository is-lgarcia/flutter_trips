import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/Place/model/place.dart';
import 'package:fluttertrips/Place/ui/widgets/card_image.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CardImageList extends StatefulWidget {
  User user;

  CardImageList(@required this.user);

  @override
  _CardImageListState createState() => _CardImageListState();
}

class _CardImageListState extends State<CardImageList> {
  UserBloc userBloc;
  IconData iconDataLiked = Icons.favorite;
  IconData iconDataLike = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(top: 80.0),
        height: 270.0,
        child: StreamBuilder(
            stream: userBloc.placesStream,
            // ignore: missing_return
            builder: (context, AsyncSnapshot snapshot) {
              List<Place> places =
                  userBloc.buildPlaces(snapshot.data.documents, widget.user);

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  return ListView(
                    padding: EdgeInsets.all(25.0),
                    scrollDirection: Axis.horizontal,
                    children: places.map((place) {
                      return CardImageWithFabIcon(
                        pathImage: place.urlImage,
                        width: 300.0,
                        height: 250.0,
                        left: 20.0,
                        iconData: place.liked ? iconDataLiked : iconDataLike,
                        onPressFabIcon: () {
                          setLiked(place);
                        },
                        internet: true,
                      );
                    }).toList(),
                  );
              }
            })
    );
  }

  void setLiked(Place place) {
    setState(() {
      place.liked = !place.liked;
      userBloc.likePlace(place, widget.user.uid);
    });
  }

}

/*


class CardImageList extends StatelessWidget{

  User user;

  UserBloc userBloc;

  CardImageList(@required this.user);

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 350.0,
      child: StreamBuilder(
          stream: userBloc.placesStream,
          // ignore: missing_return
          builder: (context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return ListView(
                  padding: EdgeInsets.all(25.0),
                  scrollDirection: Axis.horizontal,
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
              default:
            }
          }),
    );
  }

}*/
