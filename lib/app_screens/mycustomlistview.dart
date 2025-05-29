import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Mycustomlistview extends StatelessWidget {
  final String usernamedb;
  final String textPost;
  final String image1;
  final String image2;
  final String image3;

  const Mycustomlistview(
      {super.key,
      required this.usernamedb,
      required this.textPost,
      required this.image1,
      required this.image2,
      required this.image3});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      // height: screenHeight * 0.4199,
      constraints: BoxConstraints(minHeight: screenHeight * 0.4199),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 25, bottom: 8, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usernamedb,
                      style: TextStyle(
                        color: const Color(0xFF222222),
                        fontSize: 13,
                        fontFamily: 'poppins2',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.69,
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.7292,
                      constraints: BoxConstraints(minHeight: 20),
                      child: Text(
                        textPost,
                        style: TextStyle(
                          color: const Color(0xFF222222),
                          fontSize: 13,
                          fontFamily: 'poppins1',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.69,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 201,
                    height: 251,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(image1),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 201,
                    height: 251,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(image2),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 201,
                    height: 251,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(image3),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/favorite.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/comment.svg',
                    width: 22,
                    height: 22,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: screenWidth,
            color: Color(0xffD9D9D9),
          ),
        ],
      ),
    );
  }
}
