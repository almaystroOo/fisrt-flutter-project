import 'package:flutter/material.dart';

class Product {
  final String title;
  final String discription;
  final double price;
  final String image;

  Product(
      {@required this.title,
      @required this.discription,
      @required this.price,
      @required this.image});
}
