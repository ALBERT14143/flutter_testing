import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_login_api/model/employee.dart';
import 'package:test_login_api/model/user_response.dart';
import 'package:test_login_api/provider/shared/shared_user.dart';
import 'package:test_login_api/provider/sqlite/sql_employee.dart';
import 'package:test_login_api/screens/home/controller/details_controller.dart';
import 'package:test_login_api/screens/home/controller/home_controller.dart';
import 'package:test_login_api/screens/home/details.dart';
import 'package:test_login_api/screens/home/widgets/create_employee_dialog.dart';
import 'package:test_login_api/splash.dart';

class HomeScreen extends StatelessWidget {
  static const id = "/home";
  const HomeScreen({super.key});

   @override
  Widget build(BuildContext context) {
    print("REBUILD THIS WIDGET");
    var controller = Get.put(HomeController());

    return controller.obx((state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: Column(
          children: [
            Column(
              children: [
                FutureBuilder<Datum>(
                  future: Future.delayed(const Duration(seconds: 4)).then((value) => controller.getUserDetails()), 
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
                    
                    await controller.logout();
                    Get.offNamed(SplashScreen.id);
                  }, 
                  child: const Text("LOGOUT")
                )
              ],
            ),

            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 246, 227, 198),
                  child: Obx( () {
                      return ListView.builder(
                        itemCount: controller.listEmployee.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text("${controller.listEmployee[index].id ?? "N/A"}")
                              ),
                              title: Text("${controller.listEmployee[index].firstName!} ${controller.listEmployee[index].middleName!} ${controller.listEmployee[index].lastName!}"),
                              subtitle: Text(controller.listEmployee[index].phoneNumber!),
                              trailing: IconButton(
                                onPressed: (){
                                  controller.removeEmployee(controller.listEmployee[index].id!);
                                }, 
                                icon: const Icon(Icons.delete, color: Colors.red)
                              ),
                              onTap: () {
                                controller.setEmployee(controller.listEmployee[index]);
                                Get.toNamed(DetailsScreen.id);
                              },
                            ),
                          );
                        },
                      );
                    }
                  )
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
                return Stack(
                  children: [
                    CreateEmployeeDialog(
                      onPressed: (employee) async {
                        // await Future.delayed(const Duration(seconds: 3));
                        await controller.insert(employee).then((value) async {
                          Navigator.pop(context);
                        }, onError: (error) {
                        });
                      },
                    ),
                    Visibility(
                      visible: false,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    )
                  ],
                );
              },
            );
          }
        ),
      );
    }, onError: (error) {
      return Text(error.toString());
    }, onLoading: const Center(child: CircularProgressIndicator()));
    
  }
}