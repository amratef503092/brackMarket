part of 'gold_cubit.dart';

@immutable
abstract class GoldState {}

class GoldInitial extends GoldState {}
class GoldLoading extends GoldState {}
class GoldError extends GoldState {
  final String message;
  GoldError({required this.message});
}
class GoldLoaded extends GoldState {
}