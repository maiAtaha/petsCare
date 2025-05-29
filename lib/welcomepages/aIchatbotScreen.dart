import 'package:flutter/material.dart';

class Aichatbotscreen extends StatefulWidget {
  const Aichatbotscreen({super.key});

  @override
  State<Aichatbotscreen> createState() => _AichatbotscreenState();
}

class _AichatbotscreenState extends State<Aichatbotscreen> {
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
                  "assets/images/aibot.jpeg",
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
                    "Get Instant Pet\n Care Advice.",
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
                    "Our AI chatbot is here to answer your questions 24/7.",
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
