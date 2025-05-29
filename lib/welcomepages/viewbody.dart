import 'package:flutter/material.dart';
import 'package:petscare/loginpages/account_type_screen.dart';
import 'package:petscare/welcomepages/aIchatbotScreen.dart';
// import 'package:petscare/welcomepages/custom_page_view.dart';
import 'package:petscare/welcomepages/findNearbyVetsScreen.dart';
import 'package:petscare/welcomepages/getStartedscrean.dart';
import 'package:petscare/welcomepages/keyFeaturesScreen.dart';
import 'package:petscare/welcomepages/wlecomeMassageScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Viewbody extends StatefulWidget {
  const Viewbody({super.key});

  @override
  State<Viewbody> createState() => _ViewbodyState();
}

class _ViewbodyState extends State<Viewbody> {
  final _Controller = PageController();
  bool lastpage = true;
  void statestatemylastpage() {
    setState(() {
      lastpage = !lastpage; // Switches between true/false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ##### this is pages
          Stack(
            children: [
              PageView(
                controller: _Controller,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  Welcomemessagenscreen(),
                  Keyfeaturesscreen(),
                  Findnearbyvetsscreen(),
                  Aichatbotscreen(),
                  Getstartedscrean(),
                ],
              ),
              Positioned(
                  bottom: (MediaQuery.of(context).size.height * .07) + 135,
                  left: MediaQuery.of(context).size.width * 0.4,
                  child: SmoothPageIndicator(
                    controller: _Controller,
                    count: 5,
                    effect: ScaleEffect(
                      dotColor: Color.fromARGB(255, 183, 177, 177),
                      activeDotColor: Color(0XFF99DDCC),
                      dotWidth: 8,
                      dotHeight: 8,
                    ),
                  )),
            ],
          ),
          // ##### this is my buttons
          Positioned(
            bottom: MediaQuery.of(context).size.height * .07,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: lastpage
                    ? Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              lastpage == false;
                              statestatemylastpage();
                              _Controller.animateToPage(4,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins1',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2.38,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .35,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_Controller.page! < 4) {
                                  _Controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                }
                                if (_Controller.page == 3) {
                                  lastpage == false;
                                  statestatemylastpage();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff99DDCC),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 14),
                                elevation: 0,
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins1',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2.72,
                                ),
                              ))
                        ],
                      )
                    : Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AccountTypeScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff99DDCC),
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * .28,
                                  vertical: 14),
                              elevation: 0,
                            ),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins1',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2.72,
                              ),
                            ),
                          ),
                        ],
                      )),
          )
        ],
      ),
    );
  }
}
