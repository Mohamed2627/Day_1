import 'package:day_one/pages/Cart.dart';
import 'package:day_one/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "../pages/categories.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  List<Widget> pages = [HomePage(), Categories(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wow Pizza"), actions: [
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
      // body: Categories(),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.greenAccent,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPage,
          selectedItemColor: Colors.white,
          onTap: (value) {
            setState(() {
              print(value);
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.purple,
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              label: "Category",
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              label: "Cart",
              icon: Icon(Icons.shopping_bag_outlined),
            )
          ]),
    );
  }
}
