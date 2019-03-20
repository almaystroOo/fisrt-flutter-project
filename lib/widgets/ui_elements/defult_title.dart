import 'package:flutter/material.dart';

class DefultTilte extends StatelessWidget {
  final String title;
  DefultTilte(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    );
  }
}
