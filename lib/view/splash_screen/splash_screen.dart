import 'package:firebase_sample_new/view/home_screen/home_screen.dart';
import 'package:firebase_sample_new/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,this.isAlreadyLogged = false});

  final bool isAlreadyLogged;// for show splashscreen

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value)
     {
      if(widget.isAlreadyLogged){
         Navigator.pushReplacement(context,MaterialPageRoute(
         builder: (context)=>HomeScreen(),
      ));

      } else {
          Navigator.pushReplacement(context,MaterialPageRoute(
         builder: (context)=>LoginScreen(),
      ));

    }
     });
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),
          ),
      ),
    );
  }
}