import 'package:evna_flutter/src/blocs/chat/chat_state.dart';
import 'package:evna_flutter/src/blocs/post/post_state.dart';
import 'package:evna_flutter/src/repository/ChatRepository.dart';
import 'package:evna_flutter/src/repository/PostRepository.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Cubit<ChatState> {
  ChatBloc() : super(ChatState.idle());
  AuthRepository? authRepository = AppInjector.get<AuthRepository>();
  ChatRepository? chatRepository = AppInjector.get<ChatRepository>();

  getAllMessages() async {
    emit(ChatState.loading());
    try {
      var chats = await chatRepository!.getAllMessages();
      emit(ChatState.loaded(chats));

      return chats;
    } catch (e) {
      emit(ChatState.showError(e.toString()));
      return null;
    }
  }

  getMessagesByChatId(String chatId) async {
    emit(ChatState.loading());
    try {
      var chats = await chatRepository!.getMessagesByChatId(chatId);
      emit(ChatState.loaded(chats));

      return chats;
    } catch (e) {
      emit(ChatState.showError(e.toString()));
      return null;
    }
  }

  sendMessage(
    String currentUID,
    String otherUID,
    String chatID,
    String message,
  ) async {
    try {
      emit(ChatState.loading());

      var retval = await chatRepository!.sendMessage(
        currentUID,
        otherUID,
        chatID,
        message,
      );
      if (retval.type == ResponseModeType.Success) {
        emit(ChatState.postSuccessfully());
      } else {
        emit(ChatState.showError(retval.message));
      }
    } catch (e) {
      emit(ChatState.showError(e.toString()));
    }
  }
}
