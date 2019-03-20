import 'package:flutter/material.dart';
import './Pages/AUTH.dart';
import './pages/products.dart';
//import './pages/products_admin.dart';
import './Pages/products_admin.dart';
import './Pages/product.dart';
import './models/product.dart';
import './Pages/Product_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState();
  }
}

class _AppState extends State<MyApp> {
  List<Product> _products = [];

//final int index = );
  void didUpdateWidget(MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void addProduct(Product productData) {
    setState(() {
      _products.add(productData);
    });
  }

  void updateProduct(int index, Product productsData) {
    setState(() {
      _products[index] = productsData;
      //_products.insert(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "list app",
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.orange,
          primaryColor: Colors.orange,
          fontFamily: "oswald"),
      home: AuthPage(),
      routes: {
        '/hom': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductsAdminPage(
            addProduct: addProduct,
            updateProduct: updateProduct,
            products: _products,
            deleteProduct: _deleteProduct),
        // updateProduct ,, addProduct),
        '/edit': (BuildContext context) =>
            ProducList(_products, updateProduct, _deleteProduct),
        // '/product': (BuildContext context) => ProductPage( _products[index]['title'], _products[index]['image']),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElement = settings.name.split('/');
        if (pathElement[0] != '') {
          return null;
        }
        if (pathElement[1] == 'product') {
          final int index = int.parse(pathElement[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index].title,
                  _products[index].image,
                  _products[index].discription,
                  _products[index].price));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products),
        );
      },
    );
  }
}
