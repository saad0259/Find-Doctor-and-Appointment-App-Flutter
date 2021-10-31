import 'package:evna_flutter/src/blocs/sign_in/sign_in_state.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/repository/UserRepository.dart';
import 'package:evna_flutter/src/utils/response.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserState.idle());
  AuthRepository? authRepository = AppInjector.get<AuthRepository>();
  UserRepository? userRepository = AppInjector.get<UserRepository>();

  getCurrentUser() async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.getCurrentUser();

      emit(UserState.loadCurretUser(users));
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  updateCurrentUser(
    String firstName,
    String lastName,
    String userType,
    String userImage,
    String speciality,
  ) async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.updateCurrentUserDetails(
        firstName,
        lastName,
        userType,
        userImage,
        speciality,
      );

      emit(UserState.success());
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  addAvailableTime(
    String time,
    String date,
    String laboratory,
    location,
  ) async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.addAvailableTime(
        time,
        date,
        laboratory,
        location,
      );

      emit(UserState.success());
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  getAvailableTimes(userId) async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.getAvailableTimes(userId);

      emit(UserState.availabilityData(users));
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  getAllUsers() async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.getAllUsers();

      emit(UserState.data(users));
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  getOtherUsers() async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.getOtherUsers();

      emit(UserState.data(users));
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  getAllDoctors() async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.getAllDoctors();

      emit(UserState.data(users));
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  getFollowingUsers() async {
    try {
      emit(UserState.loading());

      var users = await userRepository!.getFollowingUsers();

      emit(UserState.data(users));
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }

  followUser(String followUserID, String followState) async {
    try {
      emit(UserState.loading());
      var retval;

      if (followState == "FOLLOW")
        retval = await userRepository!.followUser(followUserID);
      else
        retval = await userRepository!.unfollowUser(followUserID);

      if (retval.type == ResponseModeType.Success) {
        emit(UserState.success());
      } else {
        emit(UserState.showError(retval.message));
      }
    } catch (e) {
      emit(UserState.showError(e.toString()));
    }
  }
}
