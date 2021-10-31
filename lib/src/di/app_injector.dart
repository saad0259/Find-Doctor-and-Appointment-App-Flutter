import 'package:evna_flutter/src/blocs/chat/chat_bloc.dart';
import 'package:evna_flutter/src/blocs/comment/comment_bloc.dart';
import 'package:evna_flutter/src/blocs/post/post_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_in/sign_in_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/notifiers/firebase_auth_provider.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/repository/ChatRepository.dart';
import 'package:evna_flutter/src/repository/CommentRepository.dart';
import 'package:evna_flutter/src/repository/ImageUploadRepository.dart';
import 'package:evna_flutter/src/repository/PostRepository.dart';
import 'package:evna_flutter/src/repository/UserRepository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

GetIt _injector = GetIt.I;

class AppInjector {
  static final AppInjector _singleton = AppInjector._internal();

  factory AppInjector() => _singleton;

  AppInjector._internal();

  static T get<T extends Object>(
          {String? instanceName, dynamic param1, dynamic param2}) =>
      _injector<T>(instanceName: instanceName, param1: param1, param2: param2);

  static void create() async {
    _initBlocs();
    _initRepos();
    _initNotifiers();
    await Firebase.initializeApp();
  }

  static _initRepos() {
    _injector.registerFactory(() => AuthRepository());
    _injector.registerFactory(() => PostRepository());
    _injector.registerFactory(() => UserRepository());
    _injector.registerFactory(() => ImageUploadRepository());
    _injector.registerFactory(() => ChatRepository());
    _injector.registerFactory(() => CommentRepository());
  }

  static _initBlocs() {
    _injector.registerFactory(() => SignInBloc());
    _injector.registerFactory(() => SignUpBloc());
    _injector.registerFactory(() => PostBloc());
    _injector.registerFactory(() => UserBloc());
    _injector.registerFactory(() => ChatBloc());
    _injector.registerFactory(() => CommentBloc());
  }

  static void _initNotifiers() {
    _injector.registerLazySingleton(() => FirebaseAuthProvider());
  }
}
