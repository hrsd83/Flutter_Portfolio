import 'package:flutter/material.dart';
import 'package:portfolio_henry/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    debugShowCheckedModeBanner: false,
    routes: {
      'home': (context) => const MyHome(),
    },
  ));
}
