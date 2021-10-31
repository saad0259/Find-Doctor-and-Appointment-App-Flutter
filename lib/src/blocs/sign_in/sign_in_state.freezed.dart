// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInStateTearOff {
  const _$SignInStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Loading loading() {
    return const Loading();
  }

  GoogleLoading googleLoading() {
    return const GoogleLoading();
  }

  FacebookLoading facebookLoading() {
    return const FacebookLoading();
  }

  AppleLoading appleLoading() {
    return const AppleLoading();
  }

  ShowError showError(String error) {
    return ShowError(
      error,
    );
  }

  SignInSuccessfully signInSuccessfully() {
    return const SignInSuccessfully();
  }

  SignInGoogleSuccessfully signInGoogleSuccessfully(UserCredential user) {
    return SignInGoogleSuccessfully(
      user,
    );
  }

  SignInFacebookSuccessfully signInFacebookSuccessfully(UserCredential user) {
    return SignInFacebookSuccessfully(
      user,
    );
  }

  SignInAppleSuccessfully signInAppleSuccessfully(UserCredential user) {
    return SignInAppleSuccessfully(
      user,
    );
  }

  Emailsend emailsend() {
    return const Emailsend();
  }
}

/// @nodoc
const $SignInState = _$SignInStateTearOff();

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.idle()';
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
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
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
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements SignInState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'SignInState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SignInState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $GoogleLoadingCopyWith<$Res> {
  factory $GoogleLoadingCopyWith(
          GoogleLoading value, $Res Function(GoogleLoading) then) =
      _$GoogleLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoogleLoadingCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements $GoogleLoadingCopyWith<$Res> {
  _$GoogleLoadingCopyWithImpl(
      GoogleLoading _value, $Res Function(GoogleLoading) _then)
      : super(_value, (v) => _then(v as GoogleLoading));

  @override
  GoogleLoading get _value => super._value as GoogleLoading;
}

/// @nodoc

class _$GoogleLoading implements GoogleLoading {
  const _$GoogleLoading();

  @override
  String toString() {
    return 'SignInState.googleLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GoogleLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return googleLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (googleLoading != null) {
      return googleLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return googleLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (googleLoading != null) {
      return googleLoading(this);
    }
    return orElse();
  }
}

abstract class GoogleLoading implements SignInState {
  const factory GoogleLoading() = _$GoogleLoading;
}

/// @nodoc
abstract class $FacebookLoadingCopyWith<$Res> {
  factory $FacebookLoadingCopyWith(
          FacebookLoading value, $Res Function(FacebookLoading) then) =
      _$FacebookLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$FacebookLoadingCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $FacebookLoadingCopyWith<$Res> {
  _$FacebookLoadingCopyWithImpl(
      FacebookLoading _value, $Res Function(FacebookLoading) _then)
      : super(_value, (v) => _then(v as FacebookLoading));

  @override
  FacebookLoading get _value => super._value as FacebookLoading;
}

/// @nodoc

class _$FacebookLoading implements FacebookLoading {
  const _$FacebookLoading();

  @override
  String toString() {
    return 'SignInState.facebookLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FacebookLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return facebookLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (facebookLoading != null) {
      return facebookLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return facebookLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (facebookLoading != null) {
      return facebookLoading(this);
    }
    return orElse();
  }
}

abstract class FacebookLoading implements SignInState {
  const factory FacebookLoading() = _$FacebookLoading;
}

/// @nodoc
abstract class $AppleLoadingCopyWith<$Res> {
  factory $AppleLoadingCopyWith(
          AppleLoading value, $Res Function(AppleLoading) then) =
      _$AppleLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppleLoadingCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements $AppleLoadingCopyWith<$Res> {
  _$AppleLoadingCopyWithImpl(
      AppleLoading _value, $Res Function(AppleLoading) _then)
      : super(_value, (v) => _then(v as AppleLoading));

  @override
  AppleLoading get _value => super._value as AppleLoading;
}

/// @nodoc

class _$AppleLoading implements AppleLoading {
  const _$AppleLoading();

  @override
  String toString() {
    return 'SignInState.appleLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AppleLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return appleLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (appleLoading != null) {
      return appleLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return appleLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (appleLoading != null) {
      return appleLoading(this);
    }
    return orElse();
  }
}

abstract class AppleLoading implements SignInState {
  const factory AppleLoading() = _$AppleLoading;
}

/// @nodoc
abstract class $ShowErrorCopyWith<$Res> {
  factory $ShowErrorCopyWith(ShowError value, $Res Function(ShowError) then) =
      _$ShowErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ShowErrorCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.showError(error: $error)';
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
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return showError(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
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
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return showError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class ShowError implements SignInState {
  const factory ShowError(String error) = _$ShowError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowErrorCopyWith<ShowError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInSuccessfullyCopyWith<$Res> {
  factory $SignInSuccessfullyCopyWith(
          SignInSuccessfully value, $Res Function(SignInSuccessfully) then) =
      _$SignInSuccessfullyCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInSuccessfullyCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInSuccessfullyCopyWith<$Res> {
  _$SignInSuccessfullyCopyWithImpl(
      SignInSuccessfully _value, $Res Function(SignInSuccessfully) _then)
      : super(_value, (v) => _then(v as SignInSuccessfully));

  @override
  SignInSuccessfully get _value => super._value as SignInSuccessfully;
}

/// @nodoc

class _$SignInSuccessfully implements SignInSuccessfully {
  const _$SignInSuccessfully();

  @override
  String toString() {
    return 'SignInState.signInSuccessfully()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignInSuccessfully);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return signInSuccessfully();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (signInSuccessfully != null) {
      return signInSuccessfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return signInSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (signInSuccessfully != null) {
      return signInSuccessfully(this);
    }
    return orElse();
  }
}

abstract class SignInSuccessfully implements SignInState {
  const factory SignInSuccessfully() = _$SignInSuccessfully;
}

/// @nodoc
abstract class $SignInGoogleSuccessfullyCopyWith<$Res> {
  factory $SignInGoogleSuccessfullyCopyWith(SignInGoogleSuccessfully value,
          $Res Function(SignInGoogleSuccessfully) then) =
      _$SignInGoogleSuccessfullyCopyWithImpl<$Res>;
  $Res call({UserCredential user});
}

/// @nodoc
class _$SignInGoogleSuccessfullyCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInGoogleSuccessfullyCopyWith<$Res> {
  _$SignInGoogleSuccessfullyCopyWithImpl(SignInGoogleSuccessfully _value,
      $Res Function(SignInGoogleSuccessfully) _then)
      : super(_value, (v) => _then(v as SignInGoogleSuccessfully));

  @override
  SignInGoogleSuccessfully get _value =>
      super._value as SignInGoogleSuccessfully;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(SignInGoogleSuccessfully(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCredential,
    ));
  }
}

/// @nodoc

class _$SignInGoogleSuccessfully implements SignInGoogleSuccessfully {
  const _$SignInGoogleSuccessfully(this.user);

  @override
  final UserCredential user;

  @override
  String toString() {
    return 'SignInState.signInGoogleSuccessfully(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInGoogleSuccessfully &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $SignInGoogleSuccessfullyCopyWith<SignInGoogleSuccessfully> get copyWith =>
      _$SignInGoogleSuccessfullyCopyWithImpl<SignInGoogleSuccessfully>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return signInGoogleSuccessfully(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (signInGoogleSuccessfully != null) {
      return signInGoogleSuccessfully(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return signInGoogleSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (signInGoogleSuccessfully != null) {
      return signInGoogleSuccessfully(this);
    }
    return orElse();
  }
}

abstract class SignInGoogleSuccessfully implements SignInState {
  const factory SignInGoogleSuccessfully(UserCredential user) =
      _$SignInGoogleSuccessfully;

  UserCredential get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInGoogleSuccessfullyCopyWith<SignInGoogleSuccessfully> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFacebookSuccessfullyCopyWith<$Res> {
  factory $SignInFacebookSuccessfullyCopyWith(SignInFacebookSuccessfully value,
          $Res Function(SignInFacebookSuccessfully) then) =
      _$SignInFacebookSuccessfullyCopyWithImpl<$Res>;
  $Res call({UserCredential user});
}

/// @nodoc
class _$SignInFacebookSuccessfullyCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInFacebookSuccessfullyCopyWith<$Res> {
  _$SignInFacebookSuccessfullyCopyWithImpl(SignInFacebookSuccessfully _value,
      $Res Function(SignInFacebookSuccessfully) _then)
      : super(_value, (v) => _then(v as SignInFacebookSuccessfully));

  @override
  SignInFacebookSuccessfully get _value =>
      super._value as SignInFacebookSuccessfully;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(SignInFacebookSuccessfully(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCredential,
    ));
  }
}

/// @nodoc

class _$SignInFacebookSuccessfully implements SignInFacebookSuccessfully {
  const _$SignInFacebookSuccessfully(this.user);

  @override
  final UserCredential user;

  @override
  String toString() {
    return 'SignInState.signInFacebookSuccessfully(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInFacebookSuccessfully &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $SignInFacebookSuccessfullyCopyWith<SignInFacebookSuccessfully>
      get copyWith =>
          _$SignInFacebookSuccessfullyCopyWithImpl<SignInFacebookSuccessfully>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return signInFacebookSuccessfully(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (signInFacebookSuccessfully != null) {
      return signInFacebookSuccessfully(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return signInFacebookSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (signInFacebookSuccessfully != null) {
      return signInFacebookSuccessfully(this);
    }
    return orElse();
  }
}

abstract class SignInFacebookSuccessfully implements SignInState {
  const factory SignInFacebookSuccessfully(UserCredential user) =
      _$SignInFacebookSuccessfully;

  UserCredential get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInFacebookSuccessfullyCopyWith<SignInFacebookSuccessfully>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInAppleSuccessfullyCopyWith<$Res> {
  factory $SignInAppleSuccessfullyCopyWith(SignInAppleSuccessfully value,
          $Res Function(SignInAppleSuccessfully) then) =
      _$SignInAppleSuccessfullyCopyWithImpl<$Res>;
  $Res call({UserCredential user});
}

/// @nodoc
class _$SignInAppleSuccessfullyCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInAppleSuccessfullyCopyWith<$Res> {
  _$SignInAppleSuccessfullyCopyWithImpl(SignInAppleSuccessfully _value,
      $Res Function(SignInAppleSuccessfully) _then)
      : super(_value, (v) => _then(v as SignInAppleSuccessfully));

  @override
  SignInAppleSuccessfully get _value => super._value as SignInAppleSuccessfully;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(SignInAppleSuccessfully(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCredential,
    ));
  }
}

/// @nodoc

class _$SignInAppleSuccessfully implements SignInAppleSuccessfully {
  const _$SignInAppleSuccessfully(this.user);

  @override
  final UserCredential user;

  @override
  String toString() {
    return 'SignInState.signInAppleSuccessfully(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInAppleSuccessfully &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $SignInAppleSuccessfullyCopyWith<SignInAppleSuccessfully> get copyWith =>
      _$SignInAppleSuccessfullyCopyWithImpl<SignInAppleSuccessfully>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return signInAppleSuccessfully(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (signInAppleSuccessfully != null) {
      return signInAppleSuccessfully(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return signInAppleSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (signInAppleSuccessfully != null) {
      return signInAppleSuccessfully(this);
    }
    return orElse();
  }
}

abstract class SignInAppleSuccessfully implements SignInState {
  const factory SignInAppleSuccessfully(UserCredential user) =
      _$SignInAppleSuccessfully;

  UserCredential get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInAppleSuccessfullyCopyWith<SignInAppleSuccessfully> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailsendCopyWith<$Res> {
  factory $EmailsendCopyWith(Emailsend value, $Res Function(Emailsend) then) =
      _$EmailsendCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailsendCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements $EmailsendCopyWith<$Res> {
  _$EmailsendCopyWithImpl(Emailsend _value, $Res Function(Emailsend) _then)
      : super(_value, (v) => _then(v as Emailsend));

  @override
  Emailsend get _value => super._value as Emailsend;
}

/// @nodoc

class _$Emailsend implements Emailsend {
  const _$Emailsend();

  @override
  String toString() {
    return 'SignInState.emailsend()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Emailsend);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() googleLoading,
    required TResult Function() facebookLoading,
    required TResult Function() appleLoading,
    required TResult Function(String error) showError,
    required TResult Function() signInSuccessfully,
    required TResult Function(UserCredential user) signInGoogleSuccessfully,
    required TResult Function(UserCredential user) signInFacebookSuccessfully,
    required TResult Function(UserCredential user) signInAppleSuccessfully,
    required TResult Function() emailsend,
  }) {
    return emailsend();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? googleLoading,
    TResult Function()? facebookLoading,
    TResult Function()? appleLoading,
    TResult Function(String error)? showError,
    TResult Function()? signInSuccessfully,
    TResult Function(UserCredential user)? signInGoogleSuccessfully,
    TResult Function(UserCredential user)? signInFacebookSuccessfully,
    TResult Function(UserCredential user)? signInAppleSuccessfully,
    TResult Function()? emailsend,
    required TResult orElse(),
  }) {
    if (emailsend != null) {
      return emailsend();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(GoogleLoading value) googleLoading,
    required TResult Function(FacebookLoading value) facebookLoading,
    required TResult Function(AppleLoading value) appleLoading,
    required TResult Function(ShowError value) showError,
    required TResult Function(SignInSuccessfully value) signInSuccessfully,
    required TResult Function(SignInGoogleSuccessfully value)
        signInGoogleSuccessfully,
    required TResult Function(SignInFacebookSuccessfully value)
        signInFacebookSuccessfully,
    required TResult Function(SignInAppleSuccessfully value)
        signInAppleSuccessfully,
    required TResult Function(Emailsend value) emailsend,
  }) {
    return emailsend(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(GoogleLoading value)? googleLoading,
    TResult Function(FacebookLoading value)? facebookLoading,
    TResult Function(AppleLoading value)? appleLoading,
    TResult Function(ShowError value)? showError,
    TResult Function(SignInSuccessfully value)? signInSuccessfully,
    TResult Function(SignInGoogleSuccessfully value)? signInGoogleSuccessfully,
    TResult Function(SignInFacebookSuccessfully value)?
        signInFacebookSuccessfully,
    TResult Function(SignInAppleSuccessfully value)? signInAppleSuccessfully,
    TResult Function(Emailsend value)? emailsend,
    required TResult orElse(),
  }) {
    if (emailsend != null) {
      return emailsend(this);
    }
    return orElse();
  }
}

abstract class Emailsend implements SignInState {
  const factory Emailsend() = _$Emailsend;
}
