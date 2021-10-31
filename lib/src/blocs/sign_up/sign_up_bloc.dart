import 'package:evna_flutter/src/blocs/sign_in/sign_in_bloc.dart';
import 'package:evna_flutter/src/repository/UserRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_state.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(SignUpState.idle());

  AuthRepository? authRepository = AppInjector.get<AuthRepository>();
  UserRepository? userRepository = AppInjector.get<UserRepository>();

  registerNewUser(
    String email,
    String password,
    String fname,
    String lname,
    String imageUrl,
  ) async {
    try {
      emit(SignUpState.signUpLoading());
      var signInBloc = AppInjector.get<SignInBloc>();
      var retval;
      retval = await authRepository!.signUpWithEmail(email, password);
      if (retval.type == ResponseModeType.Success) {
        var _credential =
            EmailAuthProvider.credential(email: email, password: password);
        var loginretval = await authRepository!.login(_credential);

        if (loginretval.type == ResponseModeType.Success) {
          authRepository!.signUpAddUserDetails(
              email, password, '', fname, lname, imageUrl, false);

          emit(SignUpState.registerSuccessfully());
        } else {
          emit(SignUpState.showError(retval.message));
        }
      } else {
        emit(SignUpState.showError(retval.message));
      }
    } catch (e) {
      emit(SignUpState.showError(e.toString()));
    }
  }

  verifyNumber(
    String code,
    String number,
    String verificationId,
  ) async {
    try {
      emit(SignUpState.signUpLoading());

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);

      var loginretval = await authRepository!.login(credential);

      if (loginretval.type == ResponseModeType.Success) {
        var userStatus = await userRepository!.getCurrentUser();
        if (userStatus.length == 0) {
          authRepository!
              .signUpAddUserDetails('', '', number, '', '', '', true);
        }

        emit(SignUpState.registerSuccessfully());
      } else {
        emit(SignUpState.showError(loginretval.message));
      }
    } catch (e) {
      emit(SignUpState.showError(e.toString()));
    }
  }

  checkPhoneNumber(String phoneNumber) {}

  sendOTP(
    String number,
  ) async {
    try {
      emit(SignUpState.signUpLoading());

      await authRepository!.firebaseAuth
          .verifyPhoneNumber(
            phoneNumber: number,
            verificationCompleted: (PhoneAuthCredential credential) {
              print(credential);
              emit(SignUpState.verificationCompleted(credential));
            },
            verificationFailed: (FirebaseAuthException e) {
              emit(SignUpState.verificationFailed(e));
            },
            codeSent: (String verificationId, int? resendToken) {
              emit(SignUpState.codeSent(verificationId, resendToken!));
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              emit(SignUpState.codeAutoRetrievalTimeout(verificationId));
            },
          )
          .then((data) {})
          .catchError((onError) {
        emit(SignUpState.showError(onError.code));
      });

      // await authRepository!.firebaseAuth
      //     .signInWithPhoneNumber(
      //   number,
      // )
      //     .then((data) {
      //   print(data.verificationId);
      // }).catchError((onError) {
      //   emit(SignUpState.showError(onError.code));
      // });
    } catch (e) {
      emit(SignUpState.showError(e.toString()));
    }
  }
}
