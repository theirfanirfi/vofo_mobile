import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/otp_screen.dart';
import 'package:my_vofo/view/widgets/simple_county_code_picker.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';

import 'signup_complete.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                    'Enter Phone Number',
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
                      'Please fill in the following detail to get started',
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
                  const SizedBox(
                    height: 5.0,
                  ),
                  SimpleCountryCodePicker(callBack: (val) => {print(val)}),
                  SizedBox(
                    height: size.height * 0.4,
                  ),
                  SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: 'Next',
                    textColor: Colors.white,
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => OtpScreen(alreadySignIn: true, user: ''))));
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
