import 'package:flutter/material.dart';
//import './ProductManger.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;
  ProductControl(this.addProduct);
//final List<String> _prod = ['sweets','drinks','gorasa'];
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //color:Colors.orange,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({'title': 'chocolate', 'image': 'assets/bmi.jpg'});
      },
      child: Text("Add Product"),
    );
  }
}
