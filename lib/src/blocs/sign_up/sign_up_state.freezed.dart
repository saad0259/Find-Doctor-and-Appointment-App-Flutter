// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpStateTearOff {
  const _$SignUpStateTearOff();

  Idle idle() {
    return const Idle();
  }

  SignUpLoading signUpLoading() {
    return const SignUpLoading();
  }

  ShowError showError(String error) {
    return ShowError(
      error,
    );
  }

  RegisterSuccessfully registerSuccessfully() {
    return const RegisterSuccessfully();
  }

  VerificationCompleted verificationCompleted(PhoneAuthCredential credential) {
    return VerificationCompleted(
      credential,
    );
  }

  VerificationFailed verificationFailed(FirebaseAuthException e) {
    return VerificationFailed(
      e,
    );
  }

  CodeSent codeSent(String verificationId, int resendToken) {
    return CodeSent(
      verificationId,
      resendToken,
    );
  }

  CodeAutoRetrievalTimeout codeAutoRetrievalTimeout(String verificationId) {
    return CodeAutoRetrievalTimeout(
      verificationId,
    );
  }
}

/// @nodoc
const $SignUpState = _$SignUpStateTearOff();

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'SignUpState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements SignUpState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $SignUpLoadingCopyWith<$Res> {
  factory $SignUpLoadingCopyWith(
          SignUpLoading value, $Res Function(SignUpLoading) then) =
      _$SignUpLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpLoadingCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpLoadingCopyWith<$Res> {
  _$SignUpLoadingCopyWithImpl(
      SignUpLoading _value, $Res Function(SignUpLoading) _then)
      : super(_value, (v) => _then(v as SignUpLoading));

  @override
  SignUpLoading get _value => super._value as SignUpLoading;
}

/// @nodoc

class _$SignUpLoading implements SignUpLoading {
  const _$SignUpLoading();

  @override
  String toString() {
    return 'SignUpState.signUpLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignUpLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return signUpLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return signUpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading(this);
    }
    return orElse();
  }
}

abstract class SignUpLoading implements SignUpState {
  const factory SignUpLoading() = _$SignUpLoading;
}

/// @nodoc
abstract class $ShowErrorCopyWith<$Res> {
  factory $ShowErrorCopyWith(ShowError value, $Res Function(ShowError) then) =
      _$ShowErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ShowErrorCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements $ShowErrorCopyWith<$Res> {
  _$ShowErrorCopyWithImpl(ShowError _value, $Res Function(ShowError) _then)
      : super(_value, (v) => _then(v as ShowError));

  @override
  ShowError get _value => super._value as ShowError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ShowError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowError implements ShowError {
  const _$ShowError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SignUpState.showError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ShowErrorCopyWith<ShowError> get copyWith =>
      _$ShowErrorCopyWithImpl<ShowError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return showError(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return showError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class ShowError implements SignUpState {
  const factory ShowError(String error) = _$ShowError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowErrorCopyWith<ShowError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterSuccessfullyCopyWith<$Res> {
  factory $RegisterSuccessfullyCopyWith(RegisterSuccessfully value,
          $Res Function(RegisterSuccessfully) then) =
      _$RegisterSuccessfullyCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterSuccessfullyCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $RegisterSuccessfullyCopyWith<$Res> {
  _$RegisterSuccessfullyCopyWithImpl(
      RegisterSuccessfully _value, $Res Function(RegisterSuccessfully) _then)
      : super(_value, (v) => _then(v as RegisterSuccessfully));

  @override
  RegisterSuccessfully get _value => super._value as RegisterSuccessfully;
}

/// @nodoc

class _$RegisterSuccessfully implements RegisterSuccessfully {
  const _$RegisterSuccessfully();

  @override
  String toString() {
    return 'SignUpState.registerSuccessfully()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegisterSuccessfully);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return registerSuccessfully();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (registerSuccessfully != null) {
      return registerSuccessfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return registerSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (registerSuccessfully != null) {
      return registerSuccessfully(this);
    }
    return orElse();
  }
}

abstract class RegisterSuccessfully implements SignUpState {
  const factory RegisterSuccessfully() = _$RegisterSuccessfully;
}

/// @nodoc
abstract class $VerificationCompletedCopyWith<$Res> {
  factory $VerificationCompletedCopyWith(VerificationCompleted value,
          $Res Function(VerificationCompleted) then) =
      _$VerificationCompletedCopyWithImpl<$Res>;
  $Res call({PhoneAuthCredential credential});
}

/// @nodoc
class _$VerificationCompletedCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $VerificationCompletedCopyWith<$Res> {
  _$VerificationCompletedCopyWithImpl(
      VerificationCompleted _value, $Res Function(VerificationCompleted) _then)
      : super(_value, (v) => _then(v as VerificationCompleted));

  @override
  VerificationCompleted get _value => super._value as VerificationCompleted;

  @override
  $Res call({
    Object? credential = freezed,
  }) {
    return _then(VerificationCompleted(
      credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential,
    ));
  }
}

/// @nodoc

class _$VerificationCompleted implements VerificationCompleted {
  const _$VerificationCompleted(this.credential);

  @override
  final PhoneAuthCredential credential;

  @override
  String toString() {
    return 'SignUpState.verificationCompleted(credential: $credential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VerificationCompleted &&
            (identical(other.credential, credential) ||
                const DeepCollectionEquality()
                    .equals(other.credential, credential)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(credential);

  @JsonKey(ignore: true)
  @override
  $VerificationCompletedCopyWith<VerificationCompleted> get copyWith =>
      _$VerificationCompletedCopyWithImpl<VerificationCompleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return verificationCompleted(credential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationCompleted != null) {
      return verificationCompleted(credential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return verificationCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationCompleted != null) {
      return verificationCompleted(this);
    }
    return orElse();
  }
}

abstract class VerificationCompleted implements SignUpState {
  const factory VerificationCompleted(PhoneAuthCredential credential) =
      _$VerificationCompleted;

  PhoneAuthCredential get credential => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationCompletedCopyWith<VerificationCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationFailedCopyWith<$Res> {
  factory $VerificationFailedCopyWith(
          VerificationFailed value, $Res Function(VerificationFailed) then) =
      _$VerificationFailedCopyWithImpl<$Res>;
  $Res call({FirebaseAuthException e});
}

/// @nodoc
class _$VerificationFailedCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $VerificationFailedCopyWith<$Res> {
  _$VerificationFailedCopyWithImpl(
      VerificationFailed _value, $Res Function(VerificationFailed) _then)
      : super(_value, (v) => _then(v as VerificationFailed));

  @override
  VerificationFailed get _value => super._value as VerificationFailed;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(VerificationFailed(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException,
    ));
  }
}

/// @nodoc

class _$VerificationFailed implements VerificationFailed {
  const _$VerificationFailed(this.e);

  @override
  final FirebaseAuthException e;

  @override
  String toString() {
    return 'SignUpState.verificationFailed(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VerificationFailed &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  $VerificationFailedCopyWith<VerificationFailed> get copyWith =>
      _$VerificationFailedCopyWithImpl<VerificationFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return verificationFailed(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return verificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(this);
    }
    return orElse();
  }
}

abstract class VerificationFailed implements SignUpState {
  const factory VerificationFailed(FirebaseAuthException e) =
      _$VerificationFailed;

  FirebaseAuthException get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationFailedCopyWith<VerificationFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeSentCopyWith<$Res> {
  factory $CodeSentCopyWith(CodeSent value, $Res Function(CodeSent) then) =
      _$CodeSentCopyWithImpl<$Res>;
  $Res call({String verificationId, int resendToken});
}

/// @nodoc
class _$CodeSentCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements $CodeSentCopyWith<$Res> {
  _$CodeSentCopyWithImpl(CodeSent _value, $Res Function(CodeSent) _then)
      : super(_value, (v) => _then(v as CodeSent));

  @override
  CodeSent get _value => super._value as CodeSent;

  @override
  $Res call({
    Object? verificationId = freezed,
    Object? resendToken = freezed,
  }) {
    return _then(CodeSent(
      verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      resendToken == freezed
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CodeSent implements CodeSent {
  const _$CodeSent(this.verificationId, this.resendToken);

  @override
  final String verificationId;
  @override
  final int resendToken;

  @override
  String toString() {
    return 'SignUpState.codeSent(verificationId: $verificationId, resendToken: $resendToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CodeSent &&
            (identical(other.verificationId, verificationId) ||
                const DeepCollectionEquality()
                    .equals(other.verificationId, verificationId)) &&
            (identical(other.resendToken, resendToken) ||
                const DeepCollectionEquality()
                    .equals(other.resendToken, resendToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(verificationId) ^
      const DeepCollectionEquality().hash(resendToken);

  @JsonKey(ignore: true)
  @override
  $CodeSentCopyWith<CodeSent> get copyWith =>
      _$CodeSentCopyWithImpl<CodeSent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return codeSent(verificationId, resendToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(verificationId, resendToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return codeSent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(this);
    }
    return orElse();
  }
}

abstract class CodeSent implements SignUpState {
  const factory CodeSent(String verificationId, int resendToken) = _$CodeSent;

  String get verificationId => throw _privateConstructorUsedError;
  int get resendToken => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodeSentCopyWith<CodeSent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeAutoRetrievalTimeoutCopyWith<$Res> {
  factory $CodeAutoRetrievalTimeoutCopyWith(CodeAutoRetrievalTimeout value,
          $Res Function(CodeAutoRetrievalTimeout) then) =
      _$CodeAutoRetrievalTimeoutCopyWithImpl<$Res>;
  $Res call({String verificationId});
}

/// @nodoc
class _$CodeAutoRetrievalTimeoutCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements $CodeAutoRetrievalTimeoutCopyWith<$Res> {
  _$CodeAutoRetrievalTimeoutCopyWithImpl(CodeAutoRetrievalTimeout _value,
      $Res Function(CodeAutoRetrievalTimeout) _then)
      : super(_value, (v) => _then(v as CodeAutoRetrievalTimeout));

  @override
  CodeAutoRetrievalTimeout get _value =>
      super._value as CodeAutoRetrievalTimeout;

  @override
  $Res call({
    Object? verificationId = freezed,
  }) {
    return _then(CodeAutoRetrievalTimeout(
      verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CodeAutoRetrievalTimeout implements CodeAutoRetrievalTimeout {
  const _$CodeAutoRetrievalTimeout(this.verificationId);

  @override
  final String verificationId;

  @override
  String toString() {
    return 'SignUpState.codeAutoRetrievalTimeout(verificationId: $verificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CodeAutoRetrievalTimeout &&
            (identical(other.verificationId, verificationId) ||
                const DeepCollectionEquality()
                    .equals(other.verificationId, verificationId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(verificationId);

  @JsonKey(ignore: true)
  @override
  $CodeAutoRetrievalTimeoutCopyWith<CodeAutoRetrievalTimeout> get copyWith =>
      _$CodeAutoRetrievalTimeoutCopyWithImpl<CodeAutoRetrievalTimeout>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() signUpLoading,
    required TResult Function(String error) showError,
    required TResult Function() registerSuccessfully,
    required TResult Function(PhoneAuthCredential credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException e) verificationFailed,
    required TResult Function(String verificationId, int resendToken) codeSent,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return codeAutoRetrievalTimeout(verificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? signUpLoading,
    TResult Function(String error)? showError,
    TResult Function()? registerSuccessfully,
    TResult Function(PhoneAuthCredential credential)? verificationCompleted,
    TResult Function(FirebaseAuthException e)? verificationFailed,
    TResult Function(String verificationId, int resendToken)? codeSent,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeAutoRetrievalTimeout != null) {
      return codeAutoRetrievalTimeout(verificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(SignUpLoading value) signUpLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(RegisterSuccessfully value) registerSuccessfully,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
  }) {
    return codeAutoRetrievalTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(SignUpLoading value)? signUpLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(RegisterSuccessfully value)? registerSuccessfully,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    required TResult orElse(),
  }) {
    if (codeAutoRetrievalTimeout != null) {
      return codeAutoRetrievalTimeout(this);
    }
    return orElse();
  }
}

abstract class CodeAutoRetrievalTimeout implements SignUpState {
  const factory CodeAutoRetrievalTimeout(String verificationId) =
      _$CodeAutoRetrievalTimeout;

  String get verificationId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodeAutoRetrievalTimeoutCopyWith<CodeAutoRetrievalTimeout> get copyWith =>
      throw _privateConstructorUsedError;
}
