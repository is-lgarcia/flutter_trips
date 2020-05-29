import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertrips/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc{

  final _autRepository  = AuthRepository();

  //Flujo de Datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos de Uso de la Aplicación en este caso Aunteticacion
  //1. SignIn  a la aplicación con Google.
  Future<FirebaseUser> signIn() {
    return _autRepository.signInFirebase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}