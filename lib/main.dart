import 'package:flutter/material.dart';
import 'Screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    initialRoute: 'about',
    debugShowCheckedModeBanner: false,
    routes: {
      'about': (context) => const MyAbout(),
      'home': (context) => const MyHome(),
      'projects': (context) => FoldCardMain(),
    },
  ));
}
