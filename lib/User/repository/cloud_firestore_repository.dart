
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPi = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPi.updateUserData(user);
}