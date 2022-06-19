import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/screens/welcome_page/welcome_page.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedSplashScreen(
          duration: 2000,
          splash: 'images/logo.png',
          splashIconSize: 180,
          nextScreen: WelcomePage(),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.bottomToTop ,
        ),
      ),
    );
  }

}