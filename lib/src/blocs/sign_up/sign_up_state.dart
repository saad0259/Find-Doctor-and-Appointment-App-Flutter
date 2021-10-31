import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState.idle() = Idle;

  const factory SignUpState.signUpLoading() = SignUpLoading;

  const factory SignUpState.showError(String error) = ShowError;

  const factory SignUpState.registerSuccessfully() = RegisterSuccessfully;

  const factory SignUpState.verificationCompleted(
      PhoneAuthCredential credential) = VerificationCompleted;
  const factory SignUpState.verificationFailed(FirebaseAuthException e) =
      VerificationFailed;
  const factory SignUpState.codeSent(String verificationId, int resendToken) =
      CodeSent;
  const factory SignUpState.codeAutoRetrievalTimeout(String verificationId) =
      CodeAutoRetrievalTimeout;
}
