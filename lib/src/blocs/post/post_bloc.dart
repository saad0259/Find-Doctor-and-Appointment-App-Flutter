import 'package:evna_flutter/src/blocs/post/post_state.dart';
import 'package:evna_flutter/src/repository/PostRepository.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Cubit<PostState> {
  PostBloc() : super(PostState.idle());
  AuthRepository? authRepository = AppInjector.get<AuthRepository>();
  PostRepository? postRepository = AppInjector.get<PostRepository>();

  fetchPosts() async {
    emit(PostState.loading());
    try {
      var posts = await postRepository!.getAllPosts();
      emit(PostState.loaded(posts));

      return posts;
    } catch (e) {
      emit(PostState.showError(e.toString()));
      return null;
    }
  }

  addPost(String text) async {
    try {
      emit(PostState.loading());

      var retval = await postRepository!.addPost(text);
      if (retval.type == ResponseModeType.Success) {
        emit(PostState.postSuccessfully());
      } else {
        emit(PostState.showError(retval.message));
      }
    } catch (e) {
      emit(PostState.showError(e.toString()));
    }
  }

  likePost(String postId, String likeState) async {
    try {
      emit(PostState.loading());
      var retval;

      if (likeState == "LIKE")
        retval = await postRepository!.likePost(postId);
      else
        retval = await postRepository!.unlikePost(postId);

      if (retval.type == ResponseModeType.Success) {
        emit(PostState.postSuccessfully());
      } else {
        emit(PostState.showError(retval.message));
      }
    } catch (e) {
      emit(PostState.showError(e.toString()));
    }
  }
}
