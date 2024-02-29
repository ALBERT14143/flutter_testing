import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_login_api/screens/home/controller/details_controller.dart';
import 'package:test_login_api/screens/home/controller/home_controller.dart';

class DetailsScreen extends StatelessWidget {
  static const id = "/details";
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetailsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Center(
        child: InkWell(
          child: Text(controller.employee.firstName!),
          onTap: (){
            // Get.offNamed(page)
          },
        ),
      ),
    );
  }
}