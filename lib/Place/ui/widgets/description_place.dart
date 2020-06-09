import 'package:flutter/material.dart';
import 'package:fluttertrips/Place/model/place.dart';
import 'package:fluttertrips/User/bloc/bloc_user.dart';
import 'package:fluttertrips/widgets/button_purple.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class DescriptionPlace extends StatelessWidget{

  String namePlace;
  int stars;
  String descriptionPlace;

  //Metodo Constructor
  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);

    Widget titleStars(Place place){
      return Column (
        children: [
          Container (
            margin: EdgeInsets.only(
                top: 350.0,
                left: 20.0,
                right: 20.0
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                place.name,
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
          Container (
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              "Hearts: ${place.likes}",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
    }

    Widget descriptionWidget(String descriptionPlace){
      return Container(
        margin: new EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0
        ),
        child: new Text(
          descriptionPlace,
          style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF56575a)
          ),
        ),
      );
    }

    return StreamBuilder(
        stream: userBloc.placeSelectedStream,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            Place place = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleStars(place),
                descriptionWidget(place.description),
                ButtonPurple(buttonText: "Navigate", onPressed: (){})
              ],
            );
          }else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container (
                  margin: EdgeInsets.only(
                      top: 400.0,
                      left: 20.0,
                      right: 20.0
                  ),
                  child: Text(
                    "Selecciona un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            );
          }
        });


    /*//Widget para Puntuaciones de 0.5
    final start_half = Container(
        margin: EdgeInsets.only(
            top: 353.0,
            right: 3.0
        ),
        child: Icon(
          Icons.star_half,
          color: Color(0xFFf2c611),
        )
    );

    //Widget para Puntuaciones de 0.0
    final start_border = Container(
        margin: EdgeInsets.only(
            top: 353.0,
            right: 3.0
        ),
        child: Icon(
          Icons.star_border,
          color: Color(0xFFf2c611),
        )
    );

    //Wifget de las estrellas
    final star = Container(
      margin: EdgeInsets.only(
        top: 353.0,
        right: 3.0
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2c611),
      )
    );

    //Widget del titulo + estrellas
    final title_starts = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 350.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),

        Row(
          children: <Widget>[
            star,
            star,
            star,
            start_half,
            start_border
          ],
        )
      ],
    );

    final description_place = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0
      ),
      child: Text(
        descriptionPlace,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a)
        ),
        textAlign: TextAlign.justify,
      ),
    );

    //Uniendo los Widget title_start con description
    final title_start_description = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title_starts,
          description_place,
          ButtonPurple(buttonText: "Nagevar", onPressed: null)
        ],
      ),
    );
*/
    //return title_start_description;
  }

}