part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class LayoutChangeLanguage extends LayoutState {}
class LayoutChangeIndex extends LayoutState {}
