
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertrips/Place/model/place.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/User/repository/cloud_firestore_api.dart';
import 'package:fluttertrips/User/ui/widgets/card_image_profile.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPi = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPi.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) => _cloudFirestoreAPi.updatePlaceData(place);

  List<CardImageProfile> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPi.buildPlaces(placesListSnapshot);
}