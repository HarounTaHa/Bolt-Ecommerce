import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen> {
  var username, password, email;
  UserCredential userCredential;
  bool isHiddenPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  signUp() async {
    var formData = formKey.currentState;
    if (formData.validate()) {
      print("valid");
      // so save value in variable username,email,password use save() method
      formData.save();
      //  ---------------------create account with firebase-------------
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
                  context: context,
                  title: 'Error',
                  body: Text("Password is to weak"))
              .show();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
                  context: context,
                  title: 'Error',
                  body: Text("The account already exists for that email"))
              .show();
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
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
              Text("Signup", style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        username = val;
                      },
                      validator: (val) {
                        if (val == null || val == "") {
                          return "field is empty";
                        }
                        if (val.length > 100) {
                          return "username can'to be large than 100 letter";
                        }
                        if (val.length < 2) {
                          return "username can'to be less than 2 letter";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(),
                          labelText: 'username'),
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
                          return "email can'to be large than 100 letter";
                        }
                        if (val.length < 2) {
                          return "email can'to be less than 2 letter";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (val) {
                        email = val;
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
                      onSaved: (val) {
                        password = val;
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
                      UserCredential response = await signUp();
                      if (response != null) {
                        print(response.user.email);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    },
                    textColor: Colors.white,
                    child: Text('Sign Up'),
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
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Sign in',
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
