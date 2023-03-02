import 'package:flutter/material.dart';
import 'package:life/screens/home.dart';
import 'package:life/utilities/hex_color.dart';
import 'package:life/utilities/responsive.dart';
import 'package:life/widgets/splash_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadApp extends StatelessWidget {
  const LoadApp({Key? key}) : super(key: key);

  //TODO: load du lieu len
  loadingData() async {}

  @override
  Widget build(BuildContext context) {
    final mainLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: Responsive.width(50, context),
          child: const Image(
            image: AssetImage('lib/assets/images/mainLogo.png'),
            fit: BoxFit.contain,
          ),
        ),
        LoadingAnimationWidget.horizontalRotatingDots(
          color: HexColor.fromHex("EC7508"), 
          size: Responsive.width(10, context))
      ],
    );

    return SplashScreen(
      mainLogo: mainLogo,
      nextScreen: const Home(),
      function: () {
        loadingData();
      },
    );
  }
}
