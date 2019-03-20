import 'package:flutter/material.dart';
import './products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String _userName;
  String _password;
  bool _terms = true;
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': true
  };
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DecorationImage _buildBckgroundImage() {
    return DecorationImage(
      image: AssetImage(
        'assets/background.png',
      ),
      fit: BoxFit.fill,
    );
  }

  Widget _buildLogo() {
    return Container(

        ///   margin: EdgeInsets.all(5.0),
        child: Image.asset(
      'assets/flutter.png',
      height: 150.0,
    ));
  }

  Widget _usernameField() {
    return TextFormField(
      autovalidate: true,
      validator: (value) {
        if (value.isEmpty ||
            !RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
                .hasMatch(value)) {
          return 'Enter a valid Email address';
        }
      },
      onSaved: (String value) {
        setState(() {
          _formData['email'] = value;
        });
      },
      //  textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: "write your Email here",
          icon: Icon(Icons.verified_user),
          labelText: "Email :",
          filled: true,
          fillColor: Colors.white24),
      // onChanged: (String value) {
      //
      // },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Password required';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },

      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: "write your password here",
          icon: Icon(Icons.verified_user),
          labelText: "Password :",
          filled: true,
          fillColor: Colors.white24),
      // onChanged:

      // },
    );
  }

  Widget _switchtile() {
    return SwitchListTile(
      value: _terms,
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text("I Accept Terms"),
    );
  }

  void _signinForm() {
    if (!_formkey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formkey.currentState.save();
    Navigator.pushReplacementNamed(context, '/hom');

    //Theme.of(context).primaryColor,
  }

  // appBar: AppBar(
  //   title: Text("Login Page ",
  //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  //   backgroundColor: Theme.of(context).primaryColor,
  // ),
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final width = MediaQuery.of(context).size.width;
    final targetWidth = width > 550.0 ? 500.0 : width * 0.98;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(image: _buildBckgroundImage()),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              //  margin: EdgeInsets.all(5.0),

              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    _buildLogo(),
                    Container(
                      width: targetWidth,
                      child: Column(
                        children: <Widget>[
                          _usernameField(),
                          SizedBox(
                            height: 5.0,
                          ),
                          _passwordField(),
                          _switchtile(),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: _signinForm,
                      color: Colors.white30,
                      child: Text("Sign In"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //  Card(
      //   child:
      //   Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // children: [
      //   Expanded(child:
    );
  }
}
