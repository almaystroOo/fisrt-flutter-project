import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String address;
  AddressTag(this.address);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 6.5, vertical: 2.5),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 2.0),
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(address),
        ),
      ],
    );
  }
}
