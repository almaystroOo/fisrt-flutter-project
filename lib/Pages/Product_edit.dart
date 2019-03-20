import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
 final Map<String, dynamic> products;
 final Function updateProduct;
  final Function addProduct;
  ProductEdit({this.addProduct,this.updateProduct,this.products});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductEditState();
  }
}

class _ProductEditState extends State<ProductEdit> {
  // String title;
  // String discriptionValue;
  // double price = 0.0;
  final Map<String, dynamic> _formData = {
    'title': '',
    'image': 'assets/bmi.jpg',
    'description': '',
    'price': 0,
  };
  final _createForm = GlobalKey<FormState>();

  Widget _buildTitleField() {
    return TextFormField(
      //controller: _ageController,
     // initialValue: widget.products,
      validator: (String value) {
        if (value.isEmpty) {
          return 'required';
        }
      },
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
        labelText: "Product title :",
        hintText: "Enter the prouduct title  ",
        icon: new Icon(Icons.view_headline),
        labelStyle: TextStyle(
          decorationColor: Colors.blueGrey,
        ),
      ),
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDiscriptionField() {
    return TextFormField(
//controller: _ageController,
      validator: (String value) {
        if (!value.isNotEmpty) {
          return 'required';
        }
      },
      onSaved: (String value) {
        _formData['discription'] = value;
      },
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
        labelText: "Product discription  :",
        hintText: "Enter product discription  ",
        icon: new Icon(Icons.assignment),
        labelStyle: TextStyle(
          decorationColor: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      //controller: _ageController,
      validator: (String value) {
        if (!value.isNotEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'required only in numbers';
        }
      },

      onSaved: (value) {
        _formData['price'] = double.parse(value);
      },
      keyboardType: TextInputType.numberWithOptions(),
      decoration: new InputDecoration(
        labelText: "Product price :",
        hintText: "Enter the prouduct price  ",
        icon: new Icon(Icons.confirmation_number),
        labelStyle: TextStyle(
          decorationColor: Colors.blueGrey,
        ),
      ),
    );
  }

  void _submitform() {
    _createForm.currentState.validate();
    _createForm.currentState.save();

    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/hom');
  }









  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double targetWidth = width > 550.0 ? 500 : width * 0.98;
    final Widget pageContent= Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Container(
        width: targetWidth,
        margin: EdgeInsets.only(left: 5.0),
        child: Form(
          key: _createForm,
          child: ListView(
            shrinkWrap: true,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitleField(),
              _buildDiscriptionField(),
              _buildPriceField(),
              SizedBox(
                height: 10.0,
                //width: 2.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: _submitform,
                child: Text("Create"),
              ),

              // TextField(
              //   onChanged: (String value)=>{
              //  setState((){
              //      title=value;
              //  })
              //   },
              // ),
              //  Text(title),
              //   Text(price.toString()),//Center(
              //     child: RaisedButton(
              //   child: Text("Save"),
              //   onPressed: () {
              //     showBottomSheet(
              //         context: context,
              //         builder: (BuildContext context) {
              //           return Center(child: Text(" thie bottom view space "));
              //         });
              //   },
              // )),
            ],
          ),
        ),
      ),
    ); 
    return widget.products==null ? pageContent : Scaffold(
     appBar: AppBar(
          title: Text(
            "Product Edit",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).primaryColor,
         
        ),
        backgroundColor: Colors.blueGrey[200],
        body: pageContent
    );
  }
}
