// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Loading loading() {
    return const Loading();
  }

  ShowError showError(String error) {
    return ShowError(
      error,
    );
  }

  Success success() {
    return const Success();
  }

  Data data(dynamic users) {
    return Data(
      users,
    );
  }

  AvailabilityData availabilityData(dynamic users) {
    return AvailabilityData(
      users,
    );
  }

  LoadCurretUser loadCurretUser(dynamic users) {
    return LoadCurretUser(
      users,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
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
    return 'UserState.idle()';
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
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
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
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements UserState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
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
    return 'UserState.loading()';
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
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
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
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements UserState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $ShowErrorCopyWith<$Res> {
  factory $ShowErrorCopyWith(ShowError value, $Res Function(ShowError) then) =
      _$ShowErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ShowErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
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
    return 'UserState.showError(error: $error)';
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
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) {
    return showError(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
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
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) {
    return showError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class ShowError implements UserState {
  const factory ShowError(String error) = _$ShowError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowErrorCopyWith<ShowError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;
}

/// @nodoc

class _$Success implements Success {
  const _$Success();

  @override
  String toString() {
    return 'UserState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements UserState {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({dynamic users});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(Data(
      users == freezed ? _value.users : users,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data(this.users);

  @override
  final dynamic users;

  @override
  String toString() {
    return 'UserState.data(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(users);

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) {
    return data(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements UserState {
  const factory Data(dynamic users) = _$Data;

  dynamic get users => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityDataCopyWith<$Res> {
  factory $AvailabilityDataCopyWith(
          AvailabilityData value, $Res Function(AvailabilityData) then) =
      _$AvailabilityDataCopyWithImpl<$Res>;
  $Res call({dynamic users});
}

/// @nodoc
class _$AvailabilityDataCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $AvailabilityDataCopyWith<$Res> {
  _$AvailabilityDataCopyWithImpl(
      AvailabilityData _value, $Res Function(AvailabilityData) _then)
      : super(_value, (v) => _then(v as AvailabilityData));

  @override
  AvailabilityData get _value => super._value as AvailabilityData;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(AvailabilityData(
      users == freezed ? _value.users : users,
    ));
  }
}

/// @nodoc

class _$AvailabilityData implements AvailabilityData {
  const _$AvailabilityData(this.users);

  @override
  final dynamic users;

  @override
  String toString() {
    return 'UserState.availabilityData(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvailabilityData &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(users);

  @JsonKey(ignore: true)
  @override
  $AvailabilityDataCopyWith<AvailabilityData> get copyWith =>
      _$AvailabilityDataCopyWithImpl<AvailabilityData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) {
    return availabilityData(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (availabilityData != null) {
      return availabilityData(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) {
    return availabilityData(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (availabilityData != null) {
      return availabilityData(this);
    }
    return orElse();
  }
}

abstract class AvailabilityData implements UserState {
  const factory AvailabilityData(dynamic users) = _$AvailabilityData;

  dynamic get users => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailabilityDataCopyWith<AvailabilityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadCurretUserCopyWith<$Res> {
  factory $LoadCurretUserCopyWith(
          LoadCurretUser value, $Res Function(LoadCurretUser) then) =
      _$LoadCurretUserCopyWithImpl<$Res>;
  $Res call({dynamic users});
}

/// @nodoc
class _$LoadCurretUserCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $LoadCurretUserCopyWith<$Res> {
  _$LoadCurretUserCopyWithImpl(
      LoadCurretUser _value, $Res Function(LoadCurretUser) _then)
      : super(_value, (v) => _then(v as LoadCurretUser));

  @override
  LoadCurretUser get _value => super._value as LoadCurretUser;

  @override
  $Res call({
    Object? users = freezed,
  }) {
    return _then(LoadCurretUser(
      users == freezed ? _value.users : users,
    ));
  }
}

/// @nodoc

class _$LoadCurretUser implements LoadCurretUser {
  const _$LoadCurretUser(this.users);

  @override
  final dynamic users;

  @override
  String toString() {
    return 'UserState.loadCurretUser(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadCurretUser &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(users);

  @JsonKey(ignore: true)
  @override
  $LoadCurretUserCopyWith<LoadCurretUser> get copyWith =>
      _$LoadCurretUserCopyWithImpl<LoadCurretUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(String error) showError,
    required TResult Function() success,
    required TResult Function(dynamic users) data,
    required TResult Function(dynamic users) availabilityData,
    required TResult Function(dynamic users) loadCurretUser,
  }) {
    return loadCurretUser(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(String error)? showError,
    TResult Function()? success,
    TResult Function(dynamic users)? data,
    TResult Function(dynamic users)? availabilityData,
    TResult Function(dynamic users)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (loadCurretUser != null) {
      return loadCurretUser(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowError value) showError,
    required TResult Function(Success value) success,
    required TResult Function(Data value) data,
    required TResult Function(AvailabilityData value) availabilityData,
    required TResult Function(LoadCurretUser value) loadCurretUser,
  }) {
    return loadCurretUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowError value)? showError,
    TResult Function(Success value)? success,
    TResult Function(Data value)? data,
    TResult Function(AvailabilityData value)? availabilityData,
    TResult Function(LoadCurretUser value)? loadCurretUser,
    required TResult orElse(),
  }) {
    if (loadCurretUser != null) {
      return loadCurretUser(this);
    }
    return orElse();
  }
}

abstract class LoadCurretUser implements UserState {
  const factory LoadCurretUser(dynamic users) = _$LoadCurretUser;

  dynamic get users => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadCurretUserCopyWith<LoadCurretUser> get copyWith =>
      throw _privateConstructorUsedError;
}
