import 'package:flash_app_chat_2/components/rounded_button.dart';
import 'package:flash_app_chat_2/constants.dart';
import 'package:flash_app_chat_2/screens/login_screen.dart';
import 'package:flash_app_chat_2/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String? id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 10), upperBound: 100);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
     // print(controller.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText('Flash Chat',
                        textStyle: colorizeTextStyle, colors: colorizeColors)
                  ],
                  // style: TextStyle(
                  //     fontSize: 45.0,
                  //     fontWeight: FontWeight.w900,
                  //     color: Colors.blueGrey),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Login',
              pressed: () {
                Navigator.pushNamed(context, LoginScreen.id!);
              },
            ),
            RoundedButton(
              color: Colors.red,
              text: 'Register',
              pressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id!);
              },
            )
          ],
        ),
      ),
    );
  }
}
