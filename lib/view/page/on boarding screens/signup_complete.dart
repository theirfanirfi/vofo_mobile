import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/main%20screens/home_screens.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';

class SignUpComplete extends StatefulWidget {
  const SignUpComplete({super.key});

  @override
  State<SignUpComplete> createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  File? _image;
  final ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Pick an image
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 0.1,
                    child: Image(
                      image: AssetImage(ImageData.Logo),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'One More Step',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    width: size.width * 0.9,
                    child: Text(
                      'Just one more step so you can share with other users',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(89, 101, 111, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: size.height * 0.24,
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          width: size.width * 0.36,
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Image(
                                  image: AssetImage(ImageData.SignUp),
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                      Positioned(
                          bottom: 6,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                              child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                            ),
                          )),
                    ],
                  ),
                  Text(
                    'Upload Profile Picture',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 13.0),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15.0),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Date of Birth',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: '  *',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Color.fromRGBO(167, 29, 49, 1),
                                  ),
                                ),
                              ),
                            ])),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'This will not be shown publicly. Confirm your DOB, even if this account is for business, a pet, or something else',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(89, 101, 111, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  DropdownDatePicker(
                    inputDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(172, 169, 187, 1),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(172, 169, 187, 1),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    isDropdownHideUnderline: true,
                    isFormValidator: true,
                    startYear: 1900,
                    endYear: 2023,
                    width: 5,
                    onChangedDay: (value) => print('onChangedDay: $value'),
                    onChangedMonth: (value) => print('onChangedMonth: $value'),
                    onChangedYear: (value) => print('onChangedYear: $value'),
                    monthFlex: 1,
                    dayFlex: 1,
                    yearFlex: 1,
                    hintMonth: 'Month',
                    hintDay: 'Day',
                    hintYear: 'Year',
                    hintTextStyle: TextStyle(
                        color: Color.fromRGBO(89, 101, 111, 1),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                    textStyle: TextStyle(
                        color: Color.fromRGBO(89, 101, 111, 1),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: 'Sign Up',
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
