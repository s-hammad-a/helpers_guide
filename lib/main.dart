import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helperguide/controllers/edit_activities_provider.dart';
import 'package:helperguide/controllers/home_screen_provider.dart';
import 'package:helperguide/screens/edit_activities_screen.dart';
import 'package:helperguide/screens/home_screen.dart';
import 'package:helperguide/screens/intro_screen.dart';
import 'package:helperguide/screens/signin_screen.dart';
import 'package:helperguide/screens/signup_screen.dart';
import 'package:helperguide/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => EditActivitiesProvider()),
      ],
      child: MaterialApp(
        routes: {
          "/signInScreen" : (context) => const SignInScreen(),
          "/signUpScreen" : (context) => const SignUpScreen(),
          "/homeScreen" : (context) => const HomeScreen(),
          "/editActivities" : (context) => const EditActivities(),
        },
        title: 'Helper Guide',
        home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return const IntroScreen();
            }
            else {
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
