import 'package:evna_flutter/src/blocs/sign_in/sign_in_state.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Cubit<SignInState> {
  SignInBloc() : super(SignInState.idle());
  AuthRepository? authRepository = AppInjector.get<AuthRepository>();

  loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      emit(SignInState.loading());

      var _credential =
          EmailAuthProvider.credential(email: email, password: password);
      var retval = await authRepository!.login(_credential);

      if (retval.type == ResponseModeType.Success) {
        emit(SignInState.signInSuccessfully());
      } else {
        emit(SignInState.showError(retval.message));
      }
    } catch (e) {
      emit(SignInState.showError(e.toString()));
    }
  }

  checkPhoneNumber(String phoneNumber) {}

  resetPassword(String email) async {
    try {
      emit(SignInState.loading());
      await authRepository!.resetPassword(email).then((value) {
        emit(SignInState.emailsend());
      }).catchError((onError) {
        emit(SignInState.showError("Email Doesn't Exist"));
      });
    } catch (e) {
      emit(SignInState.showError(e.toString()));
    }
  }

  signInWithGoogle() async {
    emit(SignInState.googleLoading());
    try {
      await authRepository!.signInWithGoogle().then((value) {
        emit(SignInState.signInGoogleSuccessfully(value));
        if (value.additionalUserInfo!.isNewUser) {
          authRepository!.signUpAddUserDetails(
            value.user!.email.toString(),
            value.user!.email.toString(),
            '',
            value.user!.displayName.toString(),
            value.user!.displayName.toString(),
            "",
            false,
          );
        }
      });
    } catch (e) {
      emit(SignInState.showError(e.toString()));
    }
  }

  signInWithFacebook() async {
    emit(SignInState.facebookLoading());
    try {
      await authRepository!.signInWithFacebook().then((value) {
        emit(SignInState.signInFacebookSuccessfully(value!));
        if (value.additionalUserInfo!.isNewUser) {
          authRepository!.signUpAddUserDetails(
            value.user!.email.toString(),
            value.user!.email.toString(),
            '',
            value.user!.displayName.toString(),
            value.user!.displayName.toString(),
            "",
            false,
          );
        }
      });
    } catch (e) {
      if (e is FirebaseAuthException)
        emit(SignInState.showError(e.message.toString()));
    }
  }
}
