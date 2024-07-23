import 'package:flutter/material.dart';
import 'package:talkie/app/pages/profile//geneder_selection_page.dart';
import 'package:talkie/app/pages/splash/splash_page.dart';
import 'package:talkie/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkie App',
      theme: getDefaultTheme(context),
      home: GenderSelectionPage.withBlocProvider(),
    );
  }
}

