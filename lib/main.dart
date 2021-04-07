import 'package:boltecommerceapp/home_screen.dart';
import 'package:boltecommerceapp/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool isLogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.currentUser != null ? isLogin = true : isLogin = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bolt',
      home: isLogin == false ? WelcomeScreen() : HomeScreen(),
    );
  }
}
