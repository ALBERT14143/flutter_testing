import 'package:flutter/material.dart';
import 'package:test_login_api/extras/app_textfield.dart';
import 'package:test_login_api/model/employee.dart';
import 'package:test_login_api/provider/sqlite/sql_employee.dart';

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