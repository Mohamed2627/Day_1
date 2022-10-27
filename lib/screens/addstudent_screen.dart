import 'package:day_one/models/user.dart';
import 'package:day_one/network/user_api.dart';
import 'package:day_one/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  bool isVisiable = true;
  var Api = UserApi();
  var formKey = GlobalKey<FormState>();
  var user = User(Name: "", UserName: "", Password: "");
  void SaveForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      Api.AddUser(user).then((value) {
        var body = jsonDecode(value.body);
        print(body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                formKey.currentState?.reset();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else if (value.length < 3) {
                        return "Must be atleast 3 letters";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.Name = value!;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        icon: Icon(Icons.edit),
                        label: Text("Name")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else if (value.length < 3) {
                        return "Must be atleast 3 letters";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.UserName = value!;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        icon: Icon(Icons.edit),
                        label: Text("User Name")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        user.Password = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else if (value.length < 3) {
                        return "Must be atleast 3 letters";
                      }
                      return null;
                    },
                    obscureText: isVisiable,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        icon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              isVisiable = !isVisiable;
                            });
                          },
                        ),
                        label: Text("Password")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButtonWidget(
                      msg: "Save", handelpress: SaveForm, color: Colors.purple),
                )
              ],
            )),
      ),
    );
  }
}
