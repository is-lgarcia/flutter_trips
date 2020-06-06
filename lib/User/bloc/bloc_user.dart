import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertrips/Place/model/place.dart';
import 'package:fluttertrips/User/model/model_user.dart';
import 'package:fluttertrips/User/repository/auth_repository.dart';
import 'package:fluttertrips/User/repository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc {
  final _autRepository = AuthRepository();

  //Flujo de Datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos de Uso de la Aplicación en este caso Aunteticacion
  //1. SignIn  a la aplicación con Google.
  Future<FirebaseUser> signIn() {
    return _autRepository.signInFirebase();
  }

  //2. SignOut en la aplicación
  SignOut() => _autRepository.signOut();

  //3.Registrar Usuario en nuestra Base de Datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  //4.Registrat lugar en nuestra Base de Datos
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
