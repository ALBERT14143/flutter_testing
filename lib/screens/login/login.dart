import 'package:flutter/material.dart';
import 'package:test_login_api/extras/app_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var usernameCtrlr = TextEditingController();
    var passwordCtrlr = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.3,
            width: size.width * 0.7,
            color: Colors.red,
          ),
          const SizedBox(height: 32),
          AppTextfield(controller: usernameCtrlr, label: "Useranme", prefixIcon: Icons.person),
          AppTextfield(
            controller: passwordCtrlr, 
            label: "Password", 
            prefixIcon: Icons.key, 
            obscureText: true,
            showSuffix: true,
          ),

          SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red
                ),
                onPressed: (){}, 
                icon: const Icon(Icons.login, color: Colors.white), 
                label: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}

