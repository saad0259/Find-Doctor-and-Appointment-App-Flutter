// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentStateTearOff {
  const _$CommentStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Loading loading() {
    return const Loading();
  }

  Loaded loaded(dynamic data) {
    return Loaded(
      data,
    );
  }

  ShowError showError(String error) {
    return ShowError(
      error,
    );
  }

  PostSuccessfully postSuccessfully() {
    return const PostSuccessfully();
  }
}

/// @nodoc
const $CommentState = _$CommentStateTearOff();

/// @nodoc
mixin _$CommentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(dynamic data) loaded,
    required TResult Function(String error) showError,
    required TResult Function() postSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(dynamic data)? loaded,
    TResult Function(String error)? showError,
    TResult Function()? postSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ShowError value) showError,
    required TResult Function(PostSuccessfully value) postSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ShowError value)? showError,
    TResult Function(PostSuccessfully value)? postSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateCopyWith<$Res> {
  factory $CommentStateCopyWith(
          CommentState value, $Res Function(CommentState) then) =
      _$CommentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentStateCopyWithImpl<$Res> implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._value, this._then);

  final CommentState _value;
  // ignore: unused_field
  final $Res Function(CommentState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
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
    return 'CommentState.idle()';
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
    required TResult Function(dynamic data) loaded,
    required TResult Function(String error) showError,
    required TResult Function() postSuccessfully,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(dynamic data)? loaded,
    TResult Function(String error)? showError,
    TResult Function()? postSuccessfully,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(ShowError value) showError,
    required TResult Function(PostSuccessfully value) postSuccessfully,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ShowError value)? showError,
    TResult Function(PostSuccessfully value)? postSuccessfully,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements CommentState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
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
    return 'CommentState.loading()';
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
    required TResult Function(dynamic data) loaded,
    required TResult Function(String error) showError,
    required TResult Function() postSuccessfully,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(dynamic data)? loaded,
    TResult Function(String error)? showError,
    TResult Function()? postSuccessfully,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(ShowError value) showError,
    required TResult Function(PostSuccessfully value) postSuccessfully,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ShowError value)? showError,
    TResult Function(PostSuccessfully value)? postSuccessfully,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CommentState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({dynamic data});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Loaded(
      data == freezed ? _value.data : data,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(this.data);

  @override
  final dynamic data;

  @override
  String toString() {
    return 'CommentState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(dynamic data) loaded,
    required TResult Function(String error) showError,
    required TResult Function() postSuccessfully,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(dynamic data)? loaded,
    TResult Function(String error)? showError,
    TResult Function()? postSuccessfully,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ShowError value) showError,
    required TResult Function(PostSuccessfully value) postSuccessfully,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ShowError value)? showError,
    TResult Function(PostSuccessfully value)? postSuccessfully,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements CommentState {
  const factory Loaded(dynamic data) = _$Loaded;

  dynamic get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedCopyWith<Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowErrorCopyWith<$Res> {
  factory $ShowErrorCopyWith(ShowError value, $Res Function(ShowError) then) =
      _$ShowErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ShowErrorCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
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
    return 'CommentState.showError(error: $error)';
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
    required TResult Function(dynamic data) loaded,
    required TResult Function(String error) showError,
    required TResult Function() postSuccessfully,
  }) {
    return showError(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(dynamic data)? loaded,
    TResult Function(String error)? showError,
    TResult Function()? postSuccessfully,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(ShowError value) showError,
    required TResult Function(PostSuccessfully value) postSuccessfully,
  }) {
    return showError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ShowError value)? showError,
    TResult Function(PostSuccessfully value)? postSuccessfully,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class ShowError implements CommentState {
  const factory ShowError(String error) = _$ShowError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowErrorCopyWith<ShowError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostSuccessfullyCopyWith<$Res> {
  factory $PostSuccessfullyCopyWith(
          PostSuccessfully value, $Res Function(PostSuccessfully) then) =
      _$PostSuccessfullyCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostSuccessfullyCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res>
    implements $PostSuccessfullyCopyWith<$Res> {
  _$PostSuccessfullyCopyWithImpl(
      PostSuccessfully _value, $Res Function(PostSuccessfully) _then)
      : super(_value, (v) => _then(v as PostSuccessfully));

  @override
  PostSuccessfully get _value => super._value as PostSuccessfully;
}

/// @nodoc

class _$PostSuccessfully implements PostSuccessfully {
  const _$PostSuccessfully();

  @override
  String toString() {
    return 'CommentState.postSuccessfully()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PostSuccessfully);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(dynamic data) loaded,
    required TResult Function(String error) showError,
    required TResult Function() postSuccessfully,
  }) {
    return postSuccessfully();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(dynamic data)? loaded,
    TResult Function(String error)? showError,
    TResult Function()? postSuccessfully,
    required TResult orElse(),
  }) {
    if (postSuccessfully != null) {
      return postSuccessfully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ShowError value) showError,
    required TResult Function(PostSuccessfully value) postSuccessfully,
  }) {
    return postSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ShowError value)? showError,
    TResult Function(PostSuccessfully value)? postSuccessfully,
    required TResult orElse(),
  }) {
    if (postSuccessfully != null) {
      return postSuccessfully(this);
    }
    return orElse();
  }
}

abstract class PostSuccessfully implements CommentState {
  const factory PostSuccessfully() = _$PostSuccessfully;
}
