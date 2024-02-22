import 'package:flutter/material.dart';
import 'package:test_login_api/provider/shared/shared_user.dart';
import 'package:test_login_api/screens/home/home.dart';
import 'package:test_login_api/screens/login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: SharedUser().checkUser(), 
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            if (snapshot.data!) {
              return const HomeScreen();
            } else {
              return const LoginPage();
            }

          } else if(snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Initializing...")
              ],
            ));
          }
        },
      ),
    );
  }
}