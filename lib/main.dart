import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:renters/core/dio_helpers/dio_helpers.dart';
import 'package:renters/core/services/service_locator.dart';
import 'package:renters/core/utility/thems/light_theme/light_theme.dart';
import 'package:renters/firebase_options.dart';
import 'package:renters/notification_screen.dart';
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

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print(message.data);
  print("Handling a background message: ${message.messageId}");
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async 
    {
  // display a dialog with the notification details, tap ok to go to another page
        print("onDidReceiveLocalNotification");
    }

void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse) async 
    {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint('notification payload: $payload');
  }
  // await Navigator.push(
  //   context,
  //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
  // );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    EasyLocalization.ensureInitialized(),
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();

  Bloc.observer = MyBlocObserver();

  //
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

// Get the token each time the application loads

  String? token = await messaging.getToken();

  print("===============> token " + token!);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    flutterLocalNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification!.title,
      message.notification!.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          '1',
          'channelName',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
    print("message received");
    print(message.notification!.title);
    print(message.notification!.body);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  DioHelper.init();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
  );

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    navigatorKey.currentState!.push(MaterialPageRoute(
      builder: (_) => const NotificationScreenTest(),
    ));
  }

  @override
  void initState() {
    setupInteractedMessage();
  }

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
                    navigatorKey: navigatorKey,
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
      child: FirebaseAuth.instance.currentUser != null
          ? const LayoutScreen()
          : const LoginScreen(),
    );
  }
}
