import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertrips/Place/model/place.dart';
import 'package:fluttertrips/Place/ui/widgets/card_image.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/User/ui/widgets/card_image_profile.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    String uid = (await _auth.currentUser()).uid;
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _db.document("$USERS/$uid") //Reference
    }).then((value) {
      //DocumentReference,
      value.get().then((value) {
        //DocumentSnapshot
        DocumentReference refUsers = _db.collection(USERS).document(uid);
        DocumentReference refPlaces = value.reference;
        refUsers.updateData({
          'myPlaces': FieldValue.arrayUnion([refPlaces])
        });
      });
    });
  }

  List buildPlaces(List placesListSnapshot, User user) {
    List<Place> places = List<Place>();

    placesListSnapshot.forEach((p)  {
      Place place = Place(id: p.documentID, name: p.data["name"], description: p.data["description"],
          urlImage: p.data["urlImage"],likes: p.data["likes"]
      );
      List usersLikedRefs =  p.data["usersLiked"];
      place.liked = false;
      usersLikedRefs?.forEach((drUL){
        if(user.uid == drUL.documentID){
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }
/*
  List<CardImageWithFabIcon> buildPlaces(
      List<DocumentSnapshot> listPlacesSnapshot) {
    List<CardImageWithFabIcon> placesCard = List<CardImageWithFabIcon>();

    listPlacesSnapshot.forEach((element) {
      placesCard.add(CardImageWithFabIcon(
        pathImage: element.data['urlImage'],
        width: 270.0,
        height: 210.0,
        onPressFabIcon: () {
          likePlaces(element.documentID);
        },
        iconData: Icons.favorite_border,
        left: 10.0,
      ));
    });

    return placesCard;
  }*/

  List<CardImageProfile> buildMyPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageProfile> imageProfile = List<CardImageProfile>();
    placesListSnapshot.forEach((element) {
      imageProfile.add(CardImageProfile(Place(
          name: element.data['name'],
          description: element.data['description'],
          urlImage: element.data['urlImage'],
          likes: element.data['likes'])));
    });

    return imageProfile;
  }

  Future likePlaces(String idPlaces) async {
    await _db.collection(PLACES).document(idPlaces).get().then((value) {
      int likes = value.data["likes"];

      _db.collection(PLACES).document(idPlaces).updateData({
        'likes': likes+1
      });
    });
  }

  Future likePlace(Place place, String uid) async {
    await _db.collection(PLACES).document(place.id).get()
        .then((DocumentSnapshot ds){
      int likes = ds.data["likes"];

      _db.collection(PLACES).document(place.id)
          .updateData({
        'likes': place.liked?likes+1:likes-1,
        'usersLiked':
        place.liked?
        FieldValue.arrayUnion([_db.document("${USERS}/${uid}")]):
        FieldValue.arrayRemove([_db.document("${USERS}/${uid}")])
      });

    });
  }
}
