import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(
      {Key? key,
      required this.mainLogo,
      required this.nextScreen,
      required this.function})
      : super(key: key);

  final Widget mainLogo;
  final Widget nextScreen;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: mainLogo,
      splashIconSize: 1000,
      function: function(),
      nextScreen: nextScreen,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
