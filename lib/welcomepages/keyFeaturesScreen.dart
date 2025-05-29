import 'package:flutter/material.dart';

class Keyfeaturesscreen extends StatefulWidget {
  const Keyfeaturesscreen({super.key});

  @override
  State<Keyfeaturesscreen> createState() => _KeyfeaturesscreenState();
}

class _KeyfeaturesscreenState extends State<Keyfeaturesscreen> {
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
                  "assets/images/girlandscreen.jpeg",
                  height: 286,
                  width: 254,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 75, right: 31, left: 31),
              child: Column(
                children: [
                  Text(
                    "Track Your Pet’s \nHealth.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: 24,
                      fontFamily: 'Poppins2',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.92,
                    ),
                  ),
                  SizedBox(height: 22),
                  Text(
                    "Store medical records, \nvaccination history, and more\n in one place.",
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
