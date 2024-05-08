part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}
final class ProfileLoaded extends ProfileState 
{
  final UserModel profile;
  ProfileLoaded(this.profile);
}
final class ProfileError extends ProfileState {}
final class ProfileLogout extends ProfileState {}

final class UpdateProfileSuccessfully extends ProfileState {
  final UserModel profile;
  UpdateProfileSuccessfully(this.profile);
}
final class UpdateProfileError extends ProfileState 
{
  final String message;
  UpdateProfileError(this.message);
}