import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/routes.dart';
import 'package:fruit_app/screens/splash/splash_screen.dart';
import 'package:fruit_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
