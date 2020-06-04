import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertrips/User/repository/firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthApi = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthApi.signIn();

  signOut() => _firebaseAuthApi.singOut();

}