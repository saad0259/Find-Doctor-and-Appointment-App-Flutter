import 'package:evna_flutter/src/blocs/chat/chat_state.dart';
import 'package:evna_flutter/src/blocs/comment/comment_state.dart';
import 'package:evna_flutter/src/blocs/post/post_state.dart';
import 'package:evna_flutter/src/repository/ChatRepository.dart';
import 'package:evna_flutter/src/repository/CommentRepository.dart';
import 'package:evna_flutter/src/repository/PostRepository.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Cubit<CommentState> {
  CommentBloc() : super(CommentState.idle());
  AuthRepository? authRepository = AppInjector.get<AuthRepository>();
  CommentRepository? commentRepository = AppInjector.get<CommentRepository>();

  getAllCommentsByPostId(String postId) async {
    emit(CommentState.loading());
    try {
      var comments = await commentRepository!.getCommentsByPostId(postId);
      emit(CommentState.loaded(comments));

      return comments;
    } catch (e) {
      emit(CommentState.showError(e.toString()));
      return null;
    }
  }

  sendComment(
    String currentUID,
    String postId,
    String message,
  ) async {
    try {
      emit(CommentState.loading());

      var retval = await commentRepository!.sendComment(
        currentUID,
        postId,
        message,
      );
      if (retval.type == ResponseModeType.Success) {
        emit(CommentState.postSuccessfully());
      } else {
        emit(CommentState.showError(retval.message));
      }
    } catch (e) {
      emit(CommentState.showError(e.toString()));
    }
  }
}
