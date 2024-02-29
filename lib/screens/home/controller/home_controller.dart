import 'dart:async';

import 'package:get/get.dart';
import 'package:test_login_api/model/employee.dart';
import 'package:test_login_api/model/user_response.dart';
import 'package:test_login_api/provider/shared/shared_user.dart';
import 'package:test_login_api/provider/sqlite/sql_employee.dart';

class HomeController extends GetxController with StateMixin {
  var sqlEmployee = SqlEmployee();
  var sharedUser = SharedUser();
  var listEmployee = <Employee>[].obs;
  var employee = Employee();

  Future initData() async {
    try {
      change(null, status: RxStatus.loading());
      await getEmployee();
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future getEmployee() async {
    var list = await sqlEmployee.getEmployees();
    listEmployee.value = list;
  }

  Future insert(Employee employee) async {
    var id = await sqlEmployee.insertEmployee(employee: employee);
    listEmployee.add(employee.copyWith(id: id));
  }

  Future logout() async {
    await sharedUser.removeUserKey();
  }

  Future<Datum> getUserDetails() async {
    return await sharedUser.getUserData();
  }

  void setEmployee(Employee e) async {
    employee = e; 
  }

  void removeEmployee(int id) async {
    await sqlEmployee.removeEmployee(id);
    listEmployee.removeWhere((element) => element.id == id);
    refresh();
  }



  @override
  void onInit() async {
    await initData();
    super.onInit();
  }

}