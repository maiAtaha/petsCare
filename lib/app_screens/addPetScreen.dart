import 'package:flutter/material.dart';
import 'package:petscare/app_screens/customDropdownField.dart';
import 'package:petscare/app_screens/gender_selector_button.dart';
import 'package:petscare/loginpages/custom_textformfield.dart';

class Addpetscreen extends StatefulWidget {
  const Addpetscreen({super.key});

  @override
  State<Addpetscreen> createState() => _AddpetscreenState();
}

class _AddpetscreenState extends State<Addpetscreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  late final List fields;
  String? selectedSpecies;
  String? selectedBreed;
  String? selectedGender;
  final List<String> speciesList = ['Dog', 'Cat', 'Bird'];
  final List<String> breedList = ['Breed 1', 'Breed 2', 'Breed 3'];
  @override
  void initState() {
    super.initState();
    fields = [
      {
        "text": "Enter pet’s name",
        "keyboardtype": TextInputType.text,
        "obscuretext": false,
        "Controller": nameController,
        "prefixIcon": false,
        "suffixIcon": false,
        "textColor ": Color(0xffA0A0A0),
      },
      {
        "text": "Enter Date",
        "keyboardtype": TextInputType.datetime,
        "obscuretext": false,
        "Controller": dobController,
        "prefixIcon": false,
        "suffixIcon": false,
        "textColor ": Color(0xffA0A0A0),
      },
      {
        "text": "Enter Weight",
        "keyboardtype": TextInputType.text,
        "obscuretext": false,
        "Controller": weightController,
        "prefixIcon": false,
        "suffixIcon": false,
        "textColor ": Color(0xffA0A0A0),
      },
    ];
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
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: screenHeight,
              child: Column(
                children: [
                  // START APP BAR
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                      ),
                      SizedBox(width: 110),
                      Text(
                        'My Pets',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins3',
                          letterSpacing: 1.20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0125),
                  SizedBox(
                    height: 1,
                    width: screenWidth,
                    child: Container(
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                  SizedBox(height: 20),
                  // END APP BAR
                  // ###### - - - - - - #####
                  // START ADD information for pet
                  Container(
                    width: screenWidth * 0.1944,
                    height: screenHeight * 0.0898,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xffA0A0A0)),
                    child: Center(
                      child: Stack(
                        children: [
                          Icon(
                            Icons.person,
                            size: screenWidth * 0.1944,
                            color: Colors.white,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: Icon(
                              Icons.add,
                              size: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // END ADD information for pet
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1
                        Text(
                          "Pet's Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'poppins1',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.12,
                          ),
                        ),
                        CustomTextFormField(
                          hintText: fields[0]["text"],
                          keyboardType: fields[0]["keyboardtype"],
                          controller: fields[0]["Controller"],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Pet’s Date of Birth",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'poppins1',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.12,
                          ),
                        ),
                        CustomTextFormField(
                          hintText: fields[1]["text"],
                          keyboardType: fields[1]["keyboardtype"],
                          controller: fields[1]["Controller"],
                        ),
                        SizedBox(height: 16),
                        // 2
                        const Text("Pet’s Species"),
                        const SizedBox(height: 8),
                        CustomDropdownField<String>(
                          hintText: "Select Pet’s Species",
                          value: selectedSpecies,
                          items: speciesList
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (val) =>
                              setState(() => selectedSpecies = val),
                        ),
                        const SizedBox(height: 16),

                        // Breed
                        const Text("Pet’s Breed"),
                        const SizedBox(height: 8),
                        CustomDropdownField<String>(
                          hintText: "Select Pet’s Breed",
                          value: selectedBreed,
                          items: breedList
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (val) =>
                              setState(() => selectedBreed = val),
                        ),
                        const SizedBox(height: 16),
                        // 3
                        Text(
                          "Pet’s Weight",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'poppins1',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.12,
                          ),
                        ),
                        CustomTextFormField(
                          hintText: fields[2]["text"],
                          keyboardType: fields[2]["keyboardtype"],
                          controller: fields[2]["Controller"],
                        ),
                        SizedBox(height: 16),
                        // 4
                        Text(
                          "Pet’s Gender",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'poppins1',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            GenderSelectorButton(
                              gender: "Male",
                              selectedGender: selectedGender ?? "",
                              icon: Icons.male,
                              onTap: () =>
                                  setState(() => selectedGender = "Male"),
                            ),
                            const SizedBox(width: 10),
                            GenderSelectorButton(
                              gender: "Female",
                              selectedGender: selectedGender ?? "",
                              icon: Icons.female,
                              onTap: () =>
                                  setState(() => selectedGender = "Female"),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                ),
                                BoxShadow(
                                  color: Color(0xff99DDCC).withOpacity(1),
                                  offset: Offset(0, 0),
                                  blurRadius: 20,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(43),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff99DDCC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 43),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'poppins1',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2.72,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
