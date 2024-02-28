import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_login_api/extras/app_textfield.dart';
import 'package:test_login_api/model/employee.dart';
import 'package:test_login_api/model/user_response.dart';
import 'package:test_login_api/provider/shared/shared_user.dart';
import 'package:test_login_api/provider/sqlite/sql_employee.dart';
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
          Column(
            children: [
              FutureBuilder<Datum>(
                future: Future.delayed(const Duration(seconds: 4)).then((value) => SharedUser().getUserData()), 
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var userData = snapshot.data!;
                    return Column(
                      children: [
                        Text(userData.fullnameLast!),
                      ],
                    );
                  } else if (snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
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

          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 246, 227, 198),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.create),
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context) {
              return const CreateEmployeeDialog();
            },
          );
        }
      ),
    );
  }
}

class CreateEmployeeDialog extends StatelessWidget {
  const CreateEmployeeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final firstCtrlr = TextEditingController();
    final lastCtrlr = TextEditingController();
    final middleCtrlr = TextEditingController();
    final phoneCtrlr = TextEditingController();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextfield(
              controller: firstCtrlr, 
              label: "First Name", 
              prefixIcon: Icons.person
            ),
        
            AppTextfield(
              controller: middleCtrlr, 
              label: "Middle Name", 
              prefixIcon: Icons.person
            ),
        
            AppTextfield(
              controller: lastCtrlr, 
              label: "Last Name", 
              prefixIcon: Icons.person
            ),
        
            AppTextfield(
              controller: phoneCtrlr, 
              label: "Phone Number", 
              prefixIcon: Icons.phone
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red
                ),
                onPressed: () async {
                  // if (formkey.currentState!.validate()) {
                  //   await login();
                  // }

                  var sqlEmployee = SqlEmployee();
                  var employee = Employee(
                    firstName: firstCtrlr.text,
                    middleName: middleCtrlr.text,
                    lastName: lastCtrlr.text,
                    phoneNumber: phoneCtrlr.text
                  );

                  await sqlEmployee.insertEmployee(employee: employee).then((value) {
                    print(value);
                  });
                }, 
                icon: const Icon(Icons.login, color: Colors.white),
                label: const Text(
                  "SAVE",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}