import 'package:flutter/material.dart';
import 'package:sheba_dental_care_doctor/services/auth.dart';
import 'package:sheba_dental_care_doctor/utils/apputils.dart';

class Register extends StatefulWidget {
  Register({this.toogleScreen});
  final Function toogleScreen;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text("Sign up"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toogleScreen();
            },
            icon: Icon(Icons.person_outline),
            label: Text("Sign In"),
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
                  validator: (val) {
                    return val.isEmpty ? 'Enter an email' : null;
                  },
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
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (value) => _password = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    errorText: passError.isNotEmpty ? passError : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (_utils.validateEmail(_email)) {
                        print(_password);
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(_email, _password);

                        _firebaseErrorMessage(result.toString());
                      } else {
                        setState(() {
                          error = "Enter a valid email";
                        });
                      }
                    }
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _firebaseErrorMessage(String error) {
    if (error == "ERROR_WRONG_PASSWORD") {
      setState(() {
        passError = "Your password is wrong.";
      });
    } else {
      setState(() {
        error = _utils.firebaseErrorMessages(error);
      });
    }
  }
}
