import '../Data.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  var data = Data();
  List<Categori> list = [];
  Categories() {
    this.list = data.CategoryList;
  }

  @override
  Widget build(BuildContext context) {
    // print(list);

    return ListView(
      children: list
          .map((e) => MyWidget(
                categorie: e,
              ))
          .toList(),
      // children: list.map((e) => ListTile(
      //   title: Text(e.name),
      //   subtitle: Text(e.name),
    );
  }
}

class MyWidget extends StatelessWidget {
  Categori categorie;
  MyWidget({required this.categorie});

  @override
  Widget build(BuildContext context) {
    print(categorie.name);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/products");
      },
      child: ListTile(
        title: Text(categorie.name),
        subtitle: Text(categorie.desciption),
      ),
    );
  }
}
