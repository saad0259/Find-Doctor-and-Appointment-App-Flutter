import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState.idle() = Idle;

  const factory PostState.loading() = Loading;
  const factory PostState.loaded(data) = Loaded;

  const factory PostState.showError(String error) = ShowError;

  const factory PostState.postSuccessfully() = PostSuccessfully;
}
