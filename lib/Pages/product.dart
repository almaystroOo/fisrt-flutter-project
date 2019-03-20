import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/ui_elements/defult_title.dart';
class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String discription;
  final double price;
  ProductPage(this.title, this.imageUrl, this.discription, this.price);
  _showDialogeAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure !?"),
            content: Text("This action cannot be undone !"),
            actions: <Widget>[
              Container(
                alignment: Alignment.bottomLeft,
                child: FlatButton(
                  child: Text(
                    'Ignore',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              FlatButton(
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //Navigator.pop(context,false);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.blueGrey[200],
        body:
            //  Card(
            //   child:
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Card(child: Image.asset(imageUrl))),
            DefultTilte(title),
          // Text('Product ' + title + ' page details '),
            Text("discription :" + discription),
            Text("The Price : " + price.toString()),
            Container(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                color: Colors.red,
                onPressed: () => _showDialogeAlert(context),
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
