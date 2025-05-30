import 'package:flutter/material.dart';
import 'package:petscare/app_screens/appointmentCards.dart';
import 'package:petscare/app_screens/clinicsNearCard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api/user_service.dart';
import 'dart:async';

/////////////////////main
List<Map<String, dynamic>> searchResults = [];
Map<String, dynamic>? nextAppointment;
List<Map<String, dynamic>> nearbyClinics = [];

///////////////////////
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String userName = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadNextAppointment();
    _loadNearbyClinics();
  }

  Future<void> _loadUserData() async {
    final name = await UserService.getUserName() ?? 'Guest';
    setState(() {
      userName = name;
    });
  }

  ////////////////////////mai


  Future<void> _loadNextAppointment() async {
    final ownerId = await UserService.getUserId();
    if (ownerId != null) {
      await fetchNextAppointment(ownerId);
    }
  }

  Future<void> fetchNextAppointment(String ownerId) async {
    final url = Uri.parse('https://api.docai.online/api/appointments/next/$ownerId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('message')) {
          // No upcoming appointment
          setState(() {
            nextAppointment = null;
          });
        } else {
          setState(() {
            nextAppointment = data;
          });
        }
      } catch (e) {
        print('JSON decode error: $e');
        setState(() {
          nextAppointment = null;
        });
      }
    } else {
      print("Error fetching next appointment: ${response.statusCode}");
    }
  }

  Future<void> fetchClinics(String keyword) async {
    final url = Uri.parse('https://api.docai.online/api/clinics/search?q=$keyword');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          searchResults = List<Map<String, dynamic>>.from(data);
        });
      } catch (e) {
        print('JSON decode error: $e');
        setState(() {
          searchResults = [];
        });
      }
    } else {
      print("Error fetching clinics: ${response.statusCode}");
    }
  }
Future<void> _loadNearbyClinics() async {
  String? userAddress = await UserService.getUserAddress();
  if (userAddress != null) {
    final url = Uri.parse('https://api.docai.online/api/clinics/nearby/$userAddress');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          nearbyClinics = List<Map<String, dynamic>>.from(data);
        });
      } catch (e) {
        print('Nearby clinics JSON decode error: $e');
        setState(() {
          nearbyClinics = [];
        });
      }
    } else {
      print("Error fetching nearby clinics: ${response.statusCode}");
    }
  }
}

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, bottom: 10, top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // START TITLE AND PHOTO USER
                    Row(
                      children: [
                        SizedBox(
                          height: screenWidth * 0.1531,
                          width: screenWidth * 0.1531,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(180),
                            child: Container(
                              color: Color(0xffD9DEDF),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.0243),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello $userName ",
                              style: TextStyle(
                                color: const Color(0xFF222222),
                                fontSize: 16,
                                fontFamily: 'Poppins1',
                                letterSpacing: 2.72,
                              ),
                            ),
                            Text(
                              " How are you today?",
                              style: TextStyle(
                                color: const Color(0xFFA0A0A0),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2.04,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          height: screenHeight * 0.0707,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(Icons.notifications_none),
                              ),
                              SizedBox(width: screenWidth * 0.0364),
                              Icon(Icons.more_horiz, color: Colors.black),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.0179),
                    // END TITLE AND PHOTO USER
                    
                    // START SEARCH FORM
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            child: TextFormField(
                              onChanged: (value) {
                                if (_debounce?.isActive ?? false) _debounce!.cancel();
                                _debounce = Timer(Duration(milliseconds: 500), () {
                                  fetchClinics(value);
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "  Search",
                                hintStyle: TextStyle(
                                  color: const Color(0xFF49454F),
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                  letterSpacing: 0.50,
                                ),
                                prefixIcon: Icon(Icons.menu, color: Color(0xff49454F)),
                                suffixIcon: Icon(Icons.search, color: Color(0xff49454F)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffDBDEDF)),
                                  borderRadius: BorderRadius.circular(28)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffDBDEDF)),
                                  borderRadius: BorderRadius.circular(28)),
                                fillColor: Color(0xffDADEE0),
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.0337),
                    // END SEARCH FORM
                    
                    // START UPCOMING APPOINTMENTS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming appointments",
                            style: TextStyle(
                              color: const Color(0xFF222222),
                              fontSize: 16,
                              fontFamily: 'Poppins2',
                              height: 1.50,
                              letterSpacing: 0.50,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: const Color(0xFF99DDCC),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.71,
                                letterSpacing: 0.50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // UPCOMING APPOINTMENTS CARDS
                    SizedBox(
                      height: screenHeight * 0.2325,
                      child: nextAppointment != null
                          ? Appointmentcards(
                              nameclinic: nextAppointment!['clinicName'] ?? '',
                              imageclinic: (nextAppointment!['clinicImage']?.toString().startsWith('http') ?? false)
                                  ? nextAppointment!['clinicImage']
                                  : 'assets/images/photocli.jpg',
                              serv: nextAppointment!['service'] ?? '',
                              rating: double.tryParse(nextAppointment!['rating']?.toString() ?? '0') ?? 0.0,
                            )
                          : Center(
                              child: Text(
                                "No upcoming appointments",
                                style: TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                    ),
                    
                    // START CLINICS NEAR YOU
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Clinics near you",
                            style: TextStyle(
                              color: const Color(0xFF222222),
                              fontSize: 16,
                              fontFamily: 'Poppins2',
                              height: 1.50,
                              letterSpacing: 0.50,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text(
                              "See All",
                              style: TextStyle(
                                color: const Color(0xFF99DDCC),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.71,
                                letterSpacing: 0.50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // CLINICS NEAR YOU CARDS
                    ////////////////////////////////mai
                   ...searchResults.isNotEmpty
    ? searchResults.map((clinic) => Clinicsnearcard(
        nameclinic: clinic['name'] ?? '',
        imageclinic: (clinic['image']?.toString().startsWith('http') ?? false)
            ? clinic['image']
            : 'assets/images/photocli.jpg',
        cliniclocation: clinic['address'] ?? '',
        rating: double.tryParse(clinic['rating']?.toString() ?? '0') ?? 0.0,
      ))
    : nearbyClinics.isNotEmpty
        ? nearbyClinics.map((clinic) => Clinicsnearcard(
            nameclinic: clinic['userName'] ?? '',
            imageclinic: 'assets/images/photocli.jpg', 
            cliniclocation: clinic['address'] ?? '',
            rating: double.tryParse(clinic['rating']?.toString() ?? '0') ?? 0.0,
          ))
        : [
            Clinicsnearcard(
              nameclinic: "Vetspetsclinic",
              imageclinic: "assets/images/photocli1.jpg",
              cliniclocation: "amman, jordan",
              rating: 5.0),
          ],
                    /////////////////////////////////////////
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
