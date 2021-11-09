import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI/SplashScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


void main() {
  runApp(MyApp());
}
// late final GlobalKey<NavigatorState>? navigatorKey;


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'NewsBoard',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: "/", page: () => SplashScreen()),
        ]);
  }
}
