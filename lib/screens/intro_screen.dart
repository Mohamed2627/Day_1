import 'package:day_one/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wow Pizza"), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/main");
            },
            icon: const Icon(Icons.home)),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/profile");
            },
            icon: const Icon(Icons.person)),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/products");
            },
            icon: const Icon(FontAwesomeIcons.productHunt))
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonWidget(
                  msg: "Add Student",
                  color: Color.fromARGB(255, 41, 39, 176),
                  handelpress: () {
                    Navigator.of(context).pushNamed("/addstudent");
                  },
                ),
                CustomButtonWidget(
                  msg: "Browse Students",
                  color: Color.fromARGB(255, 1, 138, 81),
                  handelpress: () {
                    Navigator.of(context).pushNamed("/students");
                  },
                )
              ]),
        ),
      ),
    );
  }
}
