import 'package:flutter/material.dart';
import './Product_edit.dart';
import '../models/product.dart';
class ProducList extends StatelessWidget {
  final List<Product> products;
// int indx= products[index]
  final Function updateProduct;
  final Function deleteProduct;
  ProducList(this.products, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(products[index].title),
                background: Container(
                    color: Colors.red[900],
                    child: Center(
                        child: Text('Delete  ${products[index].title}'))),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.endToStart) {
                    deleteProduct(index);
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("${products[index].title} dismissed")));
                  }
                  if (direction == DismissDirection.startToEnd) {
                    deleteProduct(index);
                       Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("${products[index].title} dismissed")));
                  }
                    
                  // Scaffold.of(context).showSnackBar(SnackBar(
                  //     content: Text("${products[index]['title']} dismissed")));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white70.withOpacity(0.7),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(products[index].image)),
                            title: Text(products[index].title),
                            subtitle: Text(
                                "\$${products[index].price.toString()}"),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ProductEdit(
                                        products: products[index],
                                        updateProduct: updateProduct,
                                        productIndex: index,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          // ListTile(
                          //   //leading: Image.asset(products[index]['image']),
                          //   title: Text(products[index]['title']),
                          //   subtitle: Text(products[index]['discription']),
                          //   trailing: IconButton(
                          //     icon: Icon(Icons.edit),
                          //     onPressed: () {
                          //       Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (BuildContext context) {
                          //           return ProductEdit(
                          //             products: products[index],
                          //             updateProduct: updateProduct,
                          //             productIndex: index,
                          //           );
                          //           //.push(context, '/edit');
                          //         },
                          //       ));
                          //     },
                          //   ),
                          // ),

                          // Image.asset(products[index]['image']),
                        ],
                      ),
                    ),
                    // Divider(
                    //   color: Colors.black,
                    //   // Theme.of(context).primaryColor,
                    // )
                  ],
                ),
              );
            }));
  }
}
