import 'package:flutter/material.dart';
import 'package:test_login_api/provider/shared/shared_user.dart';
import 'package:test_login_api/splash.dart';

class HomeScreen extends StatelessWidget {
  static const id = "/home";
  const HomeScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          const Text("sdfdsfsdffddsf"),
          ElevatedButton(
            onPressed: () async {
              var sharedUser = SharedUser();
              await sharedUser.removeUserKey();
              Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const SplashScreen())
              );
            }, 
            child: const Text("LOGOUT")
          )
        ],
      ),
    );
  }
}