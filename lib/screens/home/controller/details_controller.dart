import 'package:get/get.dart';
import 'package:test_login_api/screens/home/controller/home_controller.dart';

class DetailsController extends GetxController{
  final employee = Get.find<HomeController>().employee;
  

  @override
  void onClose() {
    print("sdfsdfdsfdsf");
    super.onClose();
  }
}