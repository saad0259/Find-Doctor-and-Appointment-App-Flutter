import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState.idle() = Idle;

  const factory SignInState.loading() = Loading;
  const factory SignInState.googleLoading() = GoogleLoading;
  const factory SignInState.facebookLoading() = FacebookLoading;
  const factory SignInState.appleLoading() = AppleLoading;

  const factory SignInState.showError(String error) = ShowError;

  const factory SignInState.signInSuccessfully() = SignInSuccessfully;

  const factory SignInState.signInGoogleSuccessfully(UserCredential user) =
      SignInGoogleSuccessfully;
  const factory SignInState.signInFacebookSuccessfully(UserCredential user) =
      SignInFacebookSuccessfully;
  const factory SignInState.signInAppleSuccessfully(UserCredential user) =
      SignInAppleSuccessfully;

  const factory SignInState.emailsend() = Emailsend;
}
