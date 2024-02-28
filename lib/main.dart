import 'package:flutter/material.dart';
import 'package:test_login_api/routes.dart';
import 'package:test_login_api/screens/home/home.dart';
import 'package:test_login_api/screens/login/login.dart';
import 'package:test_login_api/splash.dart';

void main() {
  runApp(const MyApp(title: "Home App"));
}

class MyApp extends StatelessWidget {
  const MyApp({
    this.title = "My App",
    super.key
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute().onRouteGenerate
    );
  }
}