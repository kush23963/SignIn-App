import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  late String name, email, mobile, collegename,password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Enter name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Name'),
                    onSaved: (input) => name = input!,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Enter email';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (input) => email = input!,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Enter mobile';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Mobile'),
                    onSaved: (input) => mobile = input!,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Enter college name';
                      }
                    },
                    decoration: InputDecoration(labelText: 'College name'),
                    onSaved: (input) => collegename = input!,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.password),
                  title: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Enter password';
                      }
                    },
                    obscureText: _obscureText,
                    decoration: InputDecoration(labelText: 'Password',
                    suffixIcon: InkWell(onTap: _toggle,child: Icon(_obscureText ? Icons.visibility: Icons.visibility_off))),
                    onSaved: (input) => password = input!,
                  ),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    color: Colors.redAccent,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState!.validate()) {
      //saves to global key
      _key.currentState!.save();
      //send to next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            name: name,
            mobile: mobile,
            email: email,
            collegename: collegename,
            password: password,
            // key: _key,

          )
        )
      );
    } else {
      setState(() {
        _autovalidate = true;
      }
      );
    }
  }
}
