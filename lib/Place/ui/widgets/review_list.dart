import 'package:flutter/material.dart';
import 'file:///C:/Users/luis1/Documents/AplicacionesFlutter/flutter_trips/lib/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget{

  var review2 = new Review("assets/images/belen.jpg", "Belen García", "1 review 20 photos", "Alli...");
  var review3 = new Review("assets/images/mateo.jpg", "Mateo Garcia", "2 review 30 photos", "mamá abuuu...");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        review2,
        review3
      ],
    );
  }

}