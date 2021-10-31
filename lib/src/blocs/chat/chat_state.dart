import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState.idle() = Idle;

  const factory ChatState.loading() = Loading;

  const factory ChatState.loaded(data) = Loaded;

  const factory ChatState.showError(String error) = ShowError;

  const factory ChatState.postSuccessfully() = ChatSuccessfully;
}
