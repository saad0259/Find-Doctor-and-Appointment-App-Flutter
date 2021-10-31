import 'package:evna_flutter/src/blocs/app_bloc_observer.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/local/messages.dart';
import 'package:evna_flutter/src/screens/splash.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/routes.dart';
import 'package:evna_flutter/src/utils/sharedPreferences.dart';
import 'package:evna_flutter/src/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjector.create();
  Bloc.observer = MyBlocObserver();
  //SharedPreferences.setMockInitialValues({});
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs.getString(IS_ENG_LAN)));
}

class MyApp extends StatelessWidget {
  final String? isEnglish;
  MyApp(this.isEnglish);

  @override
  Widget build(BuildContext context) {
    GetSharedPreferences().init();
    print("Check Is Main English ${isEnglish}");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EVNA',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   fontFamily: "Poppins",
      // ),
      theme: Themes1().blueTheme,
      // darkTheme: Themes().darkTheme,
      initialRoute: SplashScreen.routeName,
      routes: routes,
      home: SplashScreen(),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      translations: Messages(),
      locale: (isEnglish == "true") ? Locale("en", "US") : Locale("fr", "FR"),
      supportedLocales: [Locale("en", "US"), Locale("fr", "FR")],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
