import 'package:flutter/material.dart';
import 'package:petscare/welcomepages/viewbody.dart';

class Logoscreen extends StatefulWidget {
  const Logoscreen({super.key});

  @override
  State<Logoscreen> createState() => _LogoscreenState();
}

class _LogoscreenState extends State<Logoscreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController!.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff99DDCC),
        width: 1000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 160,
            ),
            Container(height: 20),
            FadeTransition(
              opacity: fadingAnimation!,
              child: Text(
                "PETS CARE",
                style: TextStyle(
                  color: Color(0xffF6F6F6),
                  fontFamily: 'montserrat',
                  // fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 4.08,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Viewbody()),
      );
    });
  }
}
