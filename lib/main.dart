import 'package:day_one/screens/addstudent_screen.dart';
import 'package:day_one/screens/intro_screen.dart';
import 'package:day_one/screens/products.dart';
import 'package:day_one/screens/main_screen.dart';
import 'package:day_one/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          canvasColor: Colors.purple[50], primarySwatch: Colors.green),
      initialRoute: "/",
      routes: {
        "/": (context) => const IntroScreen(),
        "/main": (context) => const MainScreen(),
        "/addstudent": (context) => const AddStudentScreen(),
        "/profile": (context) => const Profile(),
        "/products": (context) => const Products(),
      },
    );
  }
}
