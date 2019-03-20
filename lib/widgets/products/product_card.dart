import 'package:flutter/material.dart';
import './price_tag.dart';
import '../ui_elements/defult_title.dart';
import './address_tag.dart';
import '../../models/product.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  final int productindex;
  final String address = " Sudan,Khartoum - Kalakla  ";
  ProductCard(this.product, this.productindex);
  Widget _buildImage() {
    return Image.asset(product.image);
  }

  void _buildDetails(BuildContext context) {
    Navigator.pushNamed<bool>(context, '/product/' + productindex.toString());
  }

  Widget _buildfav() {}
  Widget _bulidTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: DefultTilte(product.title),
        ),
        SizedBox(
          width: 15.0,
        ),
        PriceTag(product.price),
      ],
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          color: Theme.of(context).primaryColor,
          onPressed: () => _buildDetails(context),
          child: Text('details'),
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: () => _buildfav(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          _buildImage(),
          SizedBox(
            height: 10.0,
          ),
          _bulidTitleAndPrice(),
          AddressTag(address),
          _buildButtonBar(context),
        ],
      ),
    );
  }
}
