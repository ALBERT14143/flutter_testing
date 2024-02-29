import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_login_api/routes.dart';

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
    return GetMaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute().onRouteGenerate
    );
  }
}