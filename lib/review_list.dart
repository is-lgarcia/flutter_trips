import 'package:flutter/material.dart';
import 'package:fluttertrips/review.dart';

class ReviewList extends StatelessWidget{

  var review1 = new Review("assets/images/photo_example.jpg", "Luis y Aura", "5 review 10 photos", "Amazing");
  var review2 = new Review("assets/images/belen.jpg", "Belen García", "1 review 20 photos", "Alli...");
  var review3 = new Review("assets/images/mateo.jpg", "Mateo Garcia", "2 review 30 photos", "mamá abuuu...");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        review1,
        review2,
        review3
      ],
    );
  }

}