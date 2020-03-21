import 'package:flutter/material.dart';
import 'package:sheba_dental_care_doctor/services/auth.dart';
import 'package:sheba_dental_care_doctor/utils/apputils.dart';
import 'package:sheba_dental_care_doctor/utils/constraints.dart';

class SignIn extends StatefulWidget {
  SignIn({this.toogleScreen});
  final Function toogleScreen;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final AppUtils _utils = AppUtils();

  final _formKey = GlobalKey<FormState>();

  String error = '';
  String passError = '';

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Sign in"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toogleScreen();
            },
            icon: Icon(Icons.person_outline),
            label: Text("Sign Up"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) => _email = value,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    errorText: error.isNotEmpty ? error : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) =>
                      value.length < 6 ? 'Password should be 6+ chars' : null,
                  onChanged: (value) => _password = value,
                  obscureText: true,
                  decoration: inputDecoration.copyWith(
                    hintText: 'Password',
                    errorText: passError.isNotEmpty ? passError : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    setState(() {
                      error = '';
                      passError = '';
                    });

                    if (_formKey.currentState.validate()) {
                      if (_utils.validateEmail(_email)) {
                        print(_password);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            _email, _password);

                            print("Error signin: $result");

                        if (result.toString() == "ERROR_WRONG_PASSWORD") {
                          setState(() {
                            passError = "Your password is wrong.";
                          });
                        } else {
                          setState(() {
                            error = result.toString();
                          });
                        }
                      } else {
                        setState(() {
                          error = "Enter a valid email";
                        });
                      }
                    }
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
