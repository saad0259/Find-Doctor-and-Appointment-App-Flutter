import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.freezed.dart';

@freezed
abstract class CommentState with _$CommentState {
  const factory CommentState.idle() = Idle;

  const factory CommentState.loading() = Loading;

  const factory CommentState.loaded(data) = Loaded;

  const factory CommentState.showError(String error) = ShowError;

  const factory CommentState.postSuccessfully() = PostSuccessfully;
}
