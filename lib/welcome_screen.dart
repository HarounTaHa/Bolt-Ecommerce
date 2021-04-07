import 'package:boltecommerceapp/Utility/config.dart';
import 'package:boltecommerceapp/login_screen.dart';
import 'package:boltecommerceapp/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to ",
                      style: TextStyle(fontSize: 25, color: Colors.black45),
                    ),
                    Text(
                      "Bolt",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Explore Us",
                style: TextStyle(fontSize: 22, color: Colors.black45),
              ),
              SizedBox(
                height: 150,
              ),
              Image.asset(
                'assets/background.png',
                fit: BoxFit.fill,
                width: 300,
                height: 200,
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                width: 250,
                height: 50,
                child: RaisedButton(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.blue[500],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  textColor: Colors.white,
                  child: Text('Log in'),
                ),
              ),
              SizedBox(
                height: 20,
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
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
