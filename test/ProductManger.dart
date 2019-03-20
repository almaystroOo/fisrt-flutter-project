import 'package:flutter/material.dart';
import './Products.dart';

class ProductManger extends StatelessWidget {
  final List<Map<String, dynamic>> products;


  const ProductManger(this.products);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
        Expanded(child: Products(products)),
      ],
    );
  }
} 
