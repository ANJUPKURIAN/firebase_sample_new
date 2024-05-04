import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample_new/controller/login_screen_controller.dart';
import 'package:firebase_sample_new/controller/registration_screen_controller.dart';
import 'package:firebase_sample_new/view/home_screen/home_screen.dart';
import 'package:firebase_sample_new/view/login_screen/login_screen.dart';
import 'package:firebase_sample_new/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA3iHLIvZ1WRdy93wm62UOgniqsc68osnM", 
      appId: "1:227967740821:android:b1280f01033287a4e4a49c", 
      messagingSenderId:"" ,
      projectId: "samplework-795f4",
      storageBucket: "samplework-795f4.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>RegistrationScreenController(),
        ),
         ChangeNotifierProvider(
          create: (context)=>LoginScreenController(),
        ),
      ],
      child: MaterialApp(
      home: StreamBuilder(
       stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context,snapshot){
        if(snapshot.hasData){
         return SplashScreen(
          isAlreadyLogged: true,
         );
        }
        else{
          return SplashScreen();
        }
       }
       ),
      ),
    );
  }
}
