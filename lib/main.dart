import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:renters/core/dio_helpers/dio_helpers.dart';
import 'package:renters/core/services/service_locator.dart';
import 'package:renters/core/utility/thems/light_theme/light_theme.dart';
import 'package:renters/firebase_options.dart';
import 'package:renters/view/black_market/view/controllers/currency_cubit.dart';
import 'package:renters/view/calclator/view/controllers/crypto_cubit.dart';
import 'package:renters/view/gold/view/controllers/gold_cubit.dart';
import 'package:renters/view/home/view/controllers/home_cubit.dart';
import 'package:renters/view/layout/view/controllers/layout_cubit.dart';
import 'package:renters/view/layout/view/pages/layout_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/view/themeController/theme_cubit.dart';
import 'package:renters/view_model/observer/observer.dart';
import 'core/utility/thems/dark_theme/dark_theme.dart';
import 'view/auth/login/presentation_layer/pages/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    EasyLocalization.ensureInitialized(),

  ]);
  await   Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    setup() ;

  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LayoutCubit()),
            BlocProvider(
                create: (context) => CurrencyCubit()..geCurrencyData()),
            BlocProvider(create: (context) => GoldCubit()..getGoldData()),
            BlocProvider(create: (context) => HomeCubit()),
            BlocProvider(create: (context) => CryptoCubit()..getCryptoData()),
            BlocProvider(create: (context) => ThemeCubit()),
          ],
          child: BlocConsumer<LayoutCubit, LayoutState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocConsumer<ThemeCubit, ThemeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var theme = context.read<ThemeCubit>();
                  return MaterialApp(
                    builder: EasyLoading.init(),
                    key: navigatorKey,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    title: 'Flutter Demo',
                    theme: theme.isDark ? darkTheme : lightTheme,
                    home: child,
                    debugShowCheckedModeBanner: false,
                  );
                },
              );
            },
          )),
      child: FirebaseAuth.instance.currentUser!=null? const LayoutScreen(): const LoginScreen(),
    );
  }
}
