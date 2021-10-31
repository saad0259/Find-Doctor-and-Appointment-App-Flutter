import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState.idle() = Idle;

  const factory UserState.loading() = Loading;

  const factory UserState.showError(String error) = ShowError;

  const factory UserState.success() = Success;
  const factory UserState.data(users) = Data;
  const factory UserState.availabilityData(users) = AvailabilityData;
  const factory UserState.loadCurretUser(users) = LoadCurretUser;
}
