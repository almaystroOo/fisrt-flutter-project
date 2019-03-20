import 'package:flutter/material.dart';
import './Product_edit.dart';

class ProducList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
// int indx= products[index]
  ProducList(this.products);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Image.asset(products[index]['image']),
                  title: Text(products[index]['title']),
                  //subtitle: Text(products[index]['discription']),
                ),
              );
            }));
  }
}
