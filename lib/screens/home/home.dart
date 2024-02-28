import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_login_api/model/employee.dart';
import 'package:test_login_api/model/user_response.dart';
import 'package:test_login_api/provider/shared/shared_user.dart';
import 'package:test_login_api/provider/sqlite/sql_employee.dart';
import 'package:test_login_api/screens/home/widgets/create_employee_dialog.dart';
import 'package:test_login_api/splash.dart';

class HomeScreen extends StatefulWidget {
  static const id = "/home";
  const HomeScreen({
    super.key
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sqlEmployee = SqlEmployee();
  List<Employee>? _listEmployee;

  @override
  void initState() {
    getEmployee();
    super.initState();
  }


  Future getEmployee() async {
    var data = await sqlEmployee.getEmployees();
    setState(() {
      _listEmployee = data;
      
    });
  }

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
                child: _listEmployee != null ? ListView.builder(
                  itemCount: _listEmployee!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_listEmployee![index].firstName!),
                      ),
                    );
                  },
                ) : const SizedBox(),
              // child: FutureBuilder<List<Employee>>(
              //   future: SqlEmployee().getEmployees(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       var emp = snapshot.data!;
              //       return ListView.builder(
              //         itemCount: emp.length,
              //         itemBuilder: (context, index) {
              //           return Card(
              //             child: ListTile(
              //               title: Text(emp[index].firstName!),
              //             ),
              //           );
              //         },
              //       );
              //     } else if (snapshot.hasError) {
              //       return Center(child: Text(snapshot.error.toString()));
              //     } else {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //   }
              // ),
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