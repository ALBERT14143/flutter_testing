import 'package:flutter/material.dart';
import 'package:test_login_api/api/api_authorization.dart';
import 'package:test_login_api/extras/app_constant.dart';
import 'package:test_login_api/extras/app_textfield.dart';
import 'package:test_login_api/provider/shared/shared_user.dart';
import 'package:test_login_api/screens/home/home.dart';

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

  Future login() async {
    setState(() {
      isLoading = !isLoading;
    });
    var apiAuthorization = ApiAuthorization();
    await apiAuthorization.login(
      usernameCtrlr.text,
      passwordCtrlr.text
    ).then((value) async {
      print(value.toJson());
      if (value.data!.isNotEmpty) {
        var user = value.data!.first;
        await SharedUser().setUserData(user);

        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen())
        );
      }
    }, onError: (error) {
      print(error.toString());
    });
    setState(() {
      isLoading = !isLoading;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("rebuild this widget");

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Form(
              key: formkey ,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width * 0.7,
                      // color: Colors.red,
                      child: Image.asset(AppConstant.logo),
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
                              await login();
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

