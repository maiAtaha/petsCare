import 'package:flutter/material.dart';

class Getstartedscrean extends StatefulWidget {
  const Getstartedscrean({super.key});

  @override
  State<Getstartedscrean> createState() => _GetstartedscreanState();
}

class _GetstartedscreanState extends State<Getstartedscrean> {
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
              height: 420,
              // color: Colors.amber,
              padding: EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/helloscreen.jpeg",
                  height: 286,
                  width: 254,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 75, right: 21, left: 21),
              child: Column(
                children: [
                  Text(
                    "Let’s Get Started!",
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
                    "Create your account and add your pet’s profile ",
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
            Container(
              height: 121,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 31),
              child: Row(
                children: [
                  // Expanded(
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Color(0xff99DDCC),
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 45, vertical: 14),
                  //       elevation: 0,
                  //     ),
                  //     child: Text(
                  //       "Get Started",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 16,
                  //         fontFamily: 'Poppins1',
                  //         fontWeight: FontWeight.w400,
                  //         letterSpacing: 2.72,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
