import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Appointmentsscreen extends StatefulWidget {
  const Appointmentsscreen({super.key});

  @override
  State<Appointmentsscreen> createState() => _AppointmentsscreenState();
}

class _AppointmentsscreenState extends State<Appointmentsscreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: Stack(
        children: [
          Positioned(
            left: 207,
            top: -342,
            child: Container(
              width: 399,
              height: 432,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffBAD7DF).withOpacity(0.3),
                      blurRadius: 300,
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: SizedBox(
              height: screenHeight - screenHeight * 0.1809,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    // START TAB BAR
                    TabBar(
                      indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xff99DDCC)),
                        insets: EdgeInsets.symmetric(horizontal: 120),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                              color: const Color(0xFF222222),
                              fontSize: 14,
                              fontFamily: 'poppins2',
                              fontWeight: FontWeight.w600,
                              height: 1.71,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Canceled",
                            style: TextStyle(
                              color: const Color(0xFF222222),
                              fontSize: 14,
                              fontFamily: 'poppins2',
                              fontWeight: FontWeight.w600,
                              height: 1.71,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // START TAB BAR
                    // ###### - - - - - - #####
                    // START MY 2 TABS
                    SizedBox(
                      height: screenHeight * 0.7620,
                      child: TabBarView(
                        children: [
                          // START FIRST BAR
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/calendar.svg",
                                colorFilter: ColorFilter.mode(
                                  Color(0xffA0A0A0),
                                  BlendMode.srcIn,
                                ),
                              ),
                              Positioned(
                                right: screenWidth * 0.3292,
                                top: screenHeight * 0.4006,
                                child: SvgPicture.asset(
                                  "assets/icons/Vector.svg",
                                  colorFilter: ColorFilter.mode(
                                    Color(0xff99DDCC),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: screenHeight * 0.4786,
                                child: Text(
                                  "You currently have no appointment",
                                  style: TextStyle(
                                    color: const Color(0xFFA0A0A0),
                                    fontSize: 12,
                                    fontFamily: 'poppins3',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // END FIRST BAR
                          // ###### - - - - - - #####
                          // START SRCOND BAR
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/calendar.svg",
                                colorFilter: ColorFilter.mode(
                                  Color(0xffA0A0A0),
                                  BlendMode.srcIn,
                                ),
                              ),
                              Positioned(
                                right: screenWidth * 0.3292,
                                top: screenHeight * 0.4006,
                                child: SvgPicture.asset(
                                  "assets/icons/Vector.svg",
                                  colorFilter: ColorFilter.mode(
                                    Color(0xff99DDCC),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: screenHeight * 0.4786,
                                child: Text(
                                  "You currently have no canceled",
                                  style: TextStyle(
                                    color: const Color(0xFFA0A0A0),
                                    fontSize: 12,
                                    fontFamily: 'poppins3',
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // END SRCOND BAR
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
