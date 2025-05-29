import 'package:flutter/material.dart';

class Findnearbyvetsscreen extends StatefulWidget {
  const Findnearbyvetsscreen({super.key});

  @override
  State<Findnearbyvetsscreen> createState() => _FindnearbyvetsscreenState();
}

class _FindnearbyvetsscreenState extends State<Findnearbyvetsscreen> {
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
              padding: EdgeInsets.only(top: 30, right: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/location1.png",
                  width: 348,
                  height: 281,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  Text(
                    "Find Trusted Vets\n Nearby.",
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
                    "Search for clinics, read reviews,\n and book appointments easily.",
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
