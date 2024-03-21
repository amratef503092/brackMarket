part of 'currency_cubit.dart';

@immutable
abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}
class CurrencyLoading extends CurrencyState {}
class CurrencyLoaded extends CurrencyState {}
class CurrencyError extends CurrencyState
 {
  final String message;
  CurrencyError(this.message);
 }