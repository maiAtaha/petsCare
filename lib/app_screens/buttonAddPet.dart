import 'package:flutter/material.dart';
import 'package:petscare/app_screens/addPetScreen.dart';

class Buttonaddpet extends StatelessWidget {
  const Buttonaddpet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Addpetscreen()));
      },
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffE1ECE0),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}
