import 'package:flutter/material.dart';
import '../widgets/products/products.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;

  ProductsPage(this.products);

  //ProductsPage(this.products, this.addProduct);
  Widget _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            //leading: ,
            title: Text("Chose from Menue"),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("mange products "),
            onTap: () => Navigator.pushReplacementNamed(context, '/admin'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(context),
        appBar: AppBar(
          title: Text(
            "Product List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.red,
                onPressed: () {}),
          ],
        ),
        backgroundColor: Colors.blueGrey[200],
        body: Column(
          children: [
            Expanded(child: Products(products)),
          ],
        )
        //ListView(children : [ ProductManger('food tester')],),

        );
  }
}
