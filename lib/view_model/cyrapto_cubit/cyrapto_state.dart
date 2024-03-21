part of 'cyrapto_cubit.dart';

@immutable
abstract class CyraptoState {}

class CyraptoInitial extends CyraptoState {}
class CyraptoLoading extends CyraptoState {}
class CyraptoLoaded extends CyraptoState {
  final List<dynamic> data;
  CyraptoLoaded(this.data);
}
class CyraptoError extends CyraptoState {
  final String message;
  CyraptoError(this.message);
}
