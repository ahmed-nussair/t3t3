import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/ui/home.dart';
import 'view/ui/login.dart';
import 'view/ui/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'T3T3',
    routes: <String, WidgetBuilder>{
      '/Home': (BuildContext context) => Home(),
      '/Login': (BuildContext context) => Login(),
    },
    home: SplashScreen(),
  ));
}
