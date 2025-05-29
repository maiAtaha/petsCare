import 'package:flutter/material.dart';

class Welcomemessagenscreen extends StatefulWidget {
  const Welcomemessagenscreen({super.key});

  @override
  State<Welcomemessagenscreen> createState() => _WelcomemessagenscreenState();
}

class _WelcomemessagenscreenState extends State<Welcomemessagenscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          bottom: 58,
        ),
        color: Color(0xffF6F6F6),
        child: Column(
          children: [
            Container(
              width: 1000,
              height: 393,
              padding: EdgeInsets.only(top: 30),
              child: Stack(
                children: [
                  Positioned(
                    left: 273,
                    top: 73,
                    child: Container(
                      width: 51,
                      height: 53,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE1ECE9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 67,
                    top: 75,
                    child: Container(
                      width: 33,
                      height: 34,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE1ECE9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 333,
                    top: 37,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE1ECE9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/cat-dog1.png",
                      height: 238,
                      width: 301,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/images/bird.png",
                      height: 250,
                      width: 126,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 102, right: 50, left: 50),
              child: Column(
                children: [
                  Text(
                    "Welcome to Pets Care!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 24,
                      fontFamily: 'Poppins2',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.92,
                    ),
                  ),
                  SizedBox(height: 37),
                  Text(
                    "Your one-stop solution for managing your Pet’s health.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF888888),
                      fontSize: 16,
                      fontFamily: 'Poppins1',
                      letterSpacing: 2.72,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
