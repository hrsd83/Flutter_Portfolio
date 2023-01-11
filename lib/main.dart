import 'package:flutter/material.dart';
import 'package:portfolio_henry/about.dart';
import 'package:portfolio_henry/home.dart';
import 'package:portfolio_henry/projects.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'about',
    debugShowCheckedModeBanner: false,
    routes: {
      'about': (context) => const MyAbout(),
      'home': (context) => const MyHome(),
      'projects': (context) => const MyProjects(),
    },
  ));
}
