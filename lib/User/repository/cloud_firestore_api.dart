import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertrips/Place/model/place.dart';
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

  List<CardImageProfile> buildPlaces(
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
}
