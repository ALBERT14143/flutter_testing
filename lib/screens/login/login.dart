import 'package:flutter/material.dart';
import 'package:test_login_api/extras/app_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();
  bool obscureText = true;
  bool isLoading = false;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("rebuild this widget");

    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
      ),
      body: Stack(
        children: [
          Form(
            key: formkey ,
            child: Column(
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
                  obscureText: obscureText,
                  showSuffix: true,
                  onPressed: (){
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
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
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          setState(() {

                          });
                          isLoading = !isLoading;
                          await Future.delayed(const Duration(seconds: 3));
                          
                          setState(() {

                          });
                            isLoading = !isLoading;
                        }
                      }, 
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
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.black.withOpacity(0.9),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}

