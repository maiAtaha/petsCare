import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petscare/app_screens/mycustomlistview.dart';

class Communityscreen extends StatefulWidget {
  const Communityscreen({super.key});

  @override
  State<Communityscreen> createState() => _CommunityscreenState();
}

class _CommunityscreenState extends State<Communityscreen> {
  final List myposts = [
    {
      "usernamedb": "userName",
      "textPost": "Post Text...",
      "image1": "assets/images/Rectangle1.png",
      "image2": "assets/images/Rectangle2.png",
      "image3": "assets/images/Rectangle1.png",
    },
    {
      "usernamedb": "userName1",
      "textPost": "Post Text1...",
      "image1": "assets/images/Rectangle1.png",
      "image2": "assets/images/Rectangle2.png",
      "image3": "assets/images/Rectangle1.png",
    },
    {
      "usernamedb": "userName2",
      "textPost": "Post Text2...",
      "image1": "assets/images/Rectangle1.png",
      "image2": "assets/images/Rectangle2.png",
      "image3": "assets/images/Rectangle1.png",
    },
  ];
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
          SizedBox(
            height: screenHeight - screenHeight * 0.1809,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: screenWidth * 0.0972,
                            height: screenHeight * 0.0449,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xffD9DEDF),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                size: screenWidth * 0.0972,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Luna William",
                                    style: TextStyle(
                                      color: const Color(0xFF222222),
                                      fontSize: 13,
                                      fontFamily: 'poppins2',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.69,
                                    ),
                                  ),
                                  // SizedBox(height: 1),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "What’s New?",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      isDense: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(width: 35),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/fluent_image.svg',
                              width: 27,
                              height: 27,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xffA0A0A0), BlendMode.srcIn),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/solar_camera-outline.svg',
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xffA0A0A0), BlendMode.srcIn),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/loc.svg',
                              width: 22,
                              height: 22,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xffA0A0A0), BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  // width: 1,
                  height: 1,
                  color: Color(0xffD9D9D9),
                ),

                ...List.generate(myposts.length, (index) {
                  return Mycustomlistview(
                    usernamedb: myposts[index]["usernamedb"],
                    textPost: myposts[index]["textPost"],
                    image1: myposts[index]["image1"],
                    image2: myposts[index]["image2"],
                    image3: myposts[index]["image3"],
                  );
                })
                // Mycustomlistview(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
