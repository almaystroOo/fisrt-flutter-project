import 'package:flutter/material.dart';

import './Product_edit.dart';
import './Product_list.dart';
import '../models/product.dart';

class ProductsAdminPage extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function addProduct;
  final Function deleteProduct;
  ProductsAdminPage({this.addProduct,this.updateProduct, this.products,this.deleteProduct});
  Widget _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Menue"),
          ),
          ListTile(
            title: Text("All Products "),
            onTap: () => Navigator.pushReplacementNamed(context, '/hom'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _drawer(context),
        appBar: AppBar(
          title: Text(
            "Manage Products",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Products',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'View Products',
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey[200],
        body: TabBarView(
          children: <Widget>[
            ProductEdit(addProduct: addProduct),
            ProducList(products , updateProduct,deleteProduct),
          ],
        ),
      ),
    );
  }
}
