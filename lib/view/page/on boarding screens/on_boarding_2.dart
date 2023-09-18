import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/phone_number.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/sign_in.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/sign_up.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

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
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontSize: 22.0),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Join ',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: 'MyVoFo',
                              style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: ' Today',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ])),
                  Container(
                    width: size.width * 0.9,
                    child: Text(
                      'Come join millions of other users and share your voice',
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
                  SimpleButton(
                    backgroundColor: Colors.white,
                    text: 'Sign Up With Google',
                    textColor: Color.fromRGBO(89, 101, 111, 1),
                    borderColor: Color.fromRGBO(172, 169, 187, 1),
                    textImage: ImageData.Google,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PhoneNumber())));
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SimpleButton(
                    backgroundColor: Colors.white,
                    text: 'Sign Up With Apple',
                    textColor: Color.fromRGBO(89, 101, 111, 1),
                    borderColor: Color.fromRGBO(172, 169, 187, 1),
                    textImage: ImageData.Apple,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PhoneNumber())));
                    },
                  ),
                  Row(children: [
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: Divider(
                            color: Color.fromRGBO(172, 169, 187, 1),
                            height: 70,
                          )),
                    ),
                    Text(
                      'Or',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(89, 101, 111, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: Divider(
                            color: Color.fromRGBO(172, 169, 187, 1),
                            height: 70,
                          )),
                    ),
                  ]),
                  SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: 'Sign Up With Phone or Email',
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => SignUp())));
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'By continuing, you\'re agreeing to our customer',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(172, 169, 187, 1),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: ' terms of service, privacy policy',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(0, 159, 183, 1),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(172, 169, 187, 1),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: 'cookie policy',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(0, 159, 183, 1),
                                ),
                              ),
                            )
                          ])),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    'Already Have an account?',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SimpleButton(
                    backgroundColor: Colors.white,
                    text: 'Sign In',
                    textColor: Color.fromRGBO(0, 159, 183, 1),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => SignIn())));
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
