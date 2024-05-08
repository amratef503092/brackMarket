import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:renters/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:renters/view/news/presentation/view/news_screen.dart';
import 'package:renters/view/profile/view/profile_view.dart';

import '../../../black_market/view/pages/currency_page.dart';
import '../../../calclator/view/pages/calculator.dart';
import '../../../gold/view/pages/gold_page.dart';
import '../../../home/view/pages/home_page.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const NewsScreen(),
    const CurrencyPage(),
    const GoldPage(),
    const CryptoPage(),
    const ProfileScreen()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(LayoutChangeIndex());
  }

  void changeLanguage(BuildContext context) {
    if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('ar'));
    } else {
      context.setLocale(const Locale('en'));
    }
    emit(LayoutChangeLanguage());
  }
}
