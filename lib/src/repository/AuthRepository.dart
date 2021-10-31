import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final objec1 = {
  "type": '',
  "message": '',
  "data": '',
};

class AuthRepository {
  var firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<ResponseModel> signUpWithEmail(String email, String password) async {
    try {
      print(email + " - " + password);
      var _error = "";
      var _data = "";
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((data) {
        _data = data.user!.uid;
      }).catchError((onError) {
        if (onError.code == 'email-already-in-use') {
          print("email-already-in-use");
          _error = "email-already-in-use";
        } else if (onError.code == 'weak-password') {
          print("weak-password");
          _error = "weak-password";
        } else {
          _error = onError.code;
        }
      });

      return ResponseModel(ResponseModeType.Success,
          type:
              _error == "" ? ResponseModeType.Success : ResponseModeType.Error,
          message: _error,
          data: _data); //authResult.user != null;
    } catch (e) {
      print(e.toString());
      var message;
      return ResponseModel(ResponseModeType.Error,
          type: ResponseModeType.Error,
          message: e.toString(),
          data: e.toString()); //authResult.user != null;
    }
  }

  Future<ResponseModel> signUpWithPhone(String phone) async {
    try {
      print(phone + " - ");
      var _error = "";
      var _data = "";

      await firebaseAuth
          .verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          print(credential);
          _data = "";
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
          // _data = e.message;
          // _error = e.message;
        },
        codeSent: (String verificationId, int? resendToken) {
          print("object");
          _data = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      )
          .then((data) {
        // _data = data.
      }).catchError((onError) {
        if (onError.code == 'email-already-in-use') {
          print("email-already-in-use");
          _error = "email-already-in-use";
        } else if (onError.code == 'weak-password') {
          print("weak-password");
          _error = "weak-password";
        } else {
          _error = onError.code;
        }
      });

      return ResponseModel(ResponseModeType.Success,
          type:
              _error == "" ? ResponseModeType.Success : ResponseModeType.Error,
          message: _error,
          data: _data); //authResult.user != null;
    } catch (e) {
      print(e.toString());
      return ResponseModel(ResponseModeType.Error,
          type: ResponseModeType.Error,
          message: e.toString(),
          data: e.toString()); //authResult.user != null;
    }
  }

  Future<ResponseModel> verifyPhone(String phone) async {
    try {
      print(phone + " - ");
      var _error = "";
      var _data = "";

      await firebaseAuth
          .verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          print(credential);
          // _data = credential;
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
          _data = e.toString();
          _error = e.toString();
        },
        codeSent: (String verificationId, int? resendToken) {
          print("object");
          _data = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("object");
        },
      )
          .then((data) {
        // _data = data.
      }).catchError((onError) {
        if (onError.code == 'email-already-in-use') {
          print("email-already-in-use");
          _error = "email-already-in-use";
        } else if (onError.code == 'weak-password') {
          print("weak-password");
          _error = "weak-password";
        } else {
          _error = onError.code;
        }
      });

      return ResponseModel(ResponseModeType.Success,
          type:
              _error == "" ? ResponseModeType.Success : ResponseModeType.Error,
          message: _error,
          data: _data); //authResult.user != null;
    } catch (e) {
      print(e.toString());
      return ResponseModel(ResponseModeType.Error,
          type: ResponseModeType.Error,
          message: e.toString(),
          data: e.toString()); //authResult.user != null;
    }
  }

  Future signUpAddUserDetails(
    String email,
    String password,
    String phone,
    String fname,
    String lname,
    String imageUrl,
    bool isPhoneNumberLogin,
  ) async {
    try {
      AuthRepository? _authRepository = AppInjector.get<AuthRepository>();
      var user = await _authRepository.getCurrentUser();
      var uid = user!.uid;

      var userDoc = _db.collection(USER_BASE).doc(uid);

      await userDoc.set({
        'firstName': !isPhoneNumberLogin ? fname : '',
        'lastName': !isPhoneNumberLogin ? lname : '',
        'email': !isPhoneNumberLogin ? email : '',
        'phone': phone,
        'userId': uid,
        'objectId': uid,
        'userImage': !isPhoneNumberLogin ? imageUrl : '',
        'databaseName': USER_BASE,
        // 'userType': 'Doctor',
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponseModel> login(AuthCredential authCred) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      var _data = "";
      var _error = "";
      await firebaseAuth.signInWithCredential(authCred).then((value) {
        _data = value.user!.uid;
      }).catchError((onError) {
        _error = onError.code;
      });
      return ResponseModel(ResponseModeType.Success,
          type:
              _error == "" ? ResponseModeType.Success : ResponseModeType.Error,
          message: _error,
          data: _data);
    } catch (e) {
      return ResponseModel(ResponseModeType.Error,
          type: ResponseModeType.Error,
          message: e.toString(),
          data: e.toString());
    }
  }

  Future<User?> getCurrentUser() async {
    User? user = firebaseAuth.currentUser;

    return user;
  }

  Future logoutUser() async {
    return firebaseAuth.signOut();
  }

  Future<bool> checkUserLoggedInStatus() async {
    try {
      User? user = await getCurrentUser();
      if (user == null) {
        return false;
      } else
        return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkUserEmailVerifiedStatus() async {
    try {
      User? user = await getCurrentUser();
      if (user!.emailVerified == false && user.email != null) {
        user.sendEmailVerification();
        return user.emailVerified;
      } else if (user.email == null) {
        return true;
      } else {
        return user.emailVerified;
      }
    } catch (e) {
      return false;
    }
  }

  Future changePassword(String newPassword) {
    User? user = firebaseAuth.currentUser;
    return user!.updatePassword(newPassword);
  }

  Future resetPassword(String emailAddress) {
    return firebaseAuth.sendPasswordResetEmail(email: emailAddress);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    print("ss");
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn().catchError((onError) {
      if (onError is PlatformException) {
        if (onError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          print("ERROR_INVALID_EMAIL");
        } else if (onError.code == 'ERROR_INVALID_EMAIL') {
          print("ERROR_INVALID_EMAIL");
        } else if (onError.code == 'ERROR_WEAK_PASSWORD') {
          print("ERROR_WEAK_PASSWORD");
        } else if (onError.code == 'ERROR_WRONG_PASSWORD') {
        } else {
          print("Sign In Cancelled");
        }
      }
    });

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the authentication flow
  //   print("ss");
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
}
