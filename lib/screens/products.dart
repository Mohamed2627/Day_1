import 'package:day_one/Data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Products extends StatefulWidget {
  const Products({super.key});
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var data = Data();
  List<Food> list = [];
  _ProductsState() {
    this.list = data.popularFood;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(FontAwesomeIcons.cartPlus)],
        title: const Text("Products"),
        ),
        body:  ListView(
        children: list
            .map((e) => Column(
                  children: [
                    Image.asset("Assets/Images/plate-001.png"),
                    ListTile(title: Text(e.name), subtitle: Text(e.name))
                  ],
                ))
            .toList()),
    );
  }
}