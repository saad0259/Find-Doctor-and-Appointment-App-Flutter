import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthProvider with ChangeNotifier {
  var authRepo = AppInjector.get<AuthRepository>();
  late FirebaseAuth _firebaseUser;

  FirebaseAuth get firebaseUser => _firebaseUser;

  set firebaseUser(FirebaseAuth value) {
    _firebaseUser = value;
    notifyListeners();
  }
}
