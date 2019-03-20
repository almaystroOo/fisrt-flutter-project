import 'package:flutter/material.dart';
import './product_card.dart';
import '../../models/product.dart';
class Products extends StatelessWidget {
  final List<Product> products;
  Products(this.products);
  // final String title = 'product details';
  // final String imgUrl = 'assets/bmi.jpg';
  // void _test(int index) => print(products[index]);

  Widget _buildCards() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index){
          return ProductCard(products[index],index);
          },
      );
    } else {
      productCard = Center(
        child: Text("Please Add some products "),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildCards();
  
  }
}
  // return products.length > 0 ?

    // (BuildContext context, int index) {
    //   return Card(
    //     child: Column(
    //       children: <Widget>[
    //         Image.asset('assets/bmi.jpg'),
    //         Text(products[index])
    //       ],
    //     ),
    //   );
    //  }

    //,

    //: Center(child : Text(" add some product"));
    //   children: products
    //       .map(
    //         (element) =>
    //       )
    //       .toList(),