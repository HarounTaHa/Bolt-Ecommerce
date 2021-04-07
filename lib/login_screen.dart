import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:boltecommerceapp/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password;
  UserCredential userCredential;
  bool isHiddenPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();

  signIn() async {
    var formData = formKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
                  context: context,
                  title: 'Error',
                  body: Text("No user found for that email"))
              .show();
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
                  context: context,
                  title: 'Error',
                  body: Text("Wrong password provided for that user"))
              .show();
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print('Not Valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 20, top: 30, left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      size: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text("Login", style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val == null || val == "") {
                          return "field is empty";
                        }
                        if (val.length > 100) {
                          return "email can'to be large than 100 letter";
                        }
                        if (val.length < 2) {
                          return "email can'to be less than 2 letter";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (newValue) {
                        email = newValue;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(),
                          labelText: 'Email'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val == "") {
                          return "field is empty";
                        }
                        if (val.length > 100) {
                          return "password can'to be large than 100 letter";
                        }
                        if (val.length < 4) {
                          return "password can'to be less than 4 letter";
                        }

                        return null;
                      },
                      obscureText: isHiddenPassword,
                      onSaved: (newValue) {
                        password = newValue;
                      },
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isHiddenPassword = !isHiddenPassword;
                                });
                              },
                              child: isHiddenPassword
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                          labelText: 'Password',
                          border: UnderlineInputBorder()),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  width: 290,
                  height: 50,
                  child: RaisedButton(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.blue[500],
                    onPressed: () async {
                      UserCredential user = await signIn();
                      if (user != null) {
                        print(user);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    textColor: Colors.white,
                    child: Text('Log in'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.black45),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
