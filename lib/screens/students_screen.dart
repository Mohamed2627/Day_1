import 'package:day_one/models/student.dart';
import 'package:day_one/network/user_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  var api = UserApi();
  List<Student> list = [];
  @override
  void initState() {
    api.GetStudents().then((value) {
      setState(() {
        list = value;
      });
      print(value);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number of Students ${list.length}"),
      ),
      body: Center(
        child: Text("No Students Yet"),
      ),
    );
  }
}
