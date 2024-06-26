part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterChangePasswordVisibility extends RegisterState {}

final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final User user;

  RegisterSuccess({required this.user});
}
final class RegisterFailed extends RegisterState {
  final String message;

  RegisterFailed({required this.message});
}
