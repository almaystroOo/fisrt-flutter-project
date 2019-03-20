import 'package:flutter/material.dart';
class PriceTag extends StatelessWidget{
  final double price;
  PriceTag(this.price);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
                padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 2.5),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "\$ " + price.toString(),
                  style: TextStyle(fontFamily: "", color: Colors.white),
                ),
              );
  }

}