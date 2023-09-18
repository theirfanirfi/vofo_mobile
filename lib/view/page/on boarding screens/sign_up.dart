import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/calls/User/UserSignUpCall.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/models/HandleException.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/sign_in.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/signup_complete.dart';
import 'package:my_vofo/view/widgets/simple_county_code_picker.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';

import '../../../models/User.dart';
import 'package:localstorage/localstorage.dart';
import '../../widgets/alert_dialog.dart';
import 'otp_screen.dart';
import 'package:http/http.dart' as http;
class SignUp extends StatefulWidget {

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String name = '';
  String username = '';
  String phone = '';
  String country_code = '';
  String password = '';
  late Future<User> futureUser;
  late User fuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futureUser = postUser(name, username, password, mobile);
    // print(futureUser);

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                'Create an Account',
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
                  'Please fill in the following form to get started',
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
                            text: 'Name',
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
              SimpleTextFormField(
                hintText: 'Enter Your Name',
                obscureText: false,
                maxLength: 0,
                callBack: (val) => setState(() {name = val;}),
              ),
              const SizedBox(
                height: 15.0,
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
                            text: 'Username',
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
              SimpleTextFormField(
                hintText: 'Enter Your Username',
                obscureText: false,
                maxLength: 0,
                callBack: (val) => setState(() {username = val;}),
              ),
              const SizedBox(
                height: 15.0,
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
                            text: 'Phone',
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
                height: 5.0,
              ),
              SimpleCountryCodePicker(callBack: (val) => setState((){
                country_code = val.split(" ")[0];
                phone = val.split(" ")[1];
              })),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                child: Text(
                  'Use Email Instead',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Color.fromRGBO(0, 159, 183, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                            text: 'Password',
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
              SimpleTextFormField(
                hintText: 'Enter Your Password',
                obscureText: true,
                isPassword: true,
                maxLength: 0,
                maxLines: 1,
                callBack: (val) => setState(() {password = val;}),
              ),
              const SizedBox(
                height: 25.0,
              ),
              SimpleButton(
                backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                text: 'Continue',
                textColor: Colors.white,
                onPressed: ()  async {
                  print(name+''+username+' '+password);
                  try{
                    fuser = await postUser(name, username, password, phone, country_code);
                    VofoStorage().saveToStorage(fuser);
                    // VofoStorage().getUserFromStorage();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => OtpScreen(
                              alreadySignIn: false,
                              user: fuser,
                            ))));
                  }on Exception catch(e){
                    print('e');

                    var handling = HandleException.parseException(e.toString());
                    print(handling.status);
                    print(handling.message);
                    showAlertDialog(context, "Error", handling.message);
                    // Map<dynamic, dynamic> values = json.decode(e.toString().substring(11));
                    // print(values['message']);
                  }


                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontSize: 16.0),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => SignIn())));
                    }),
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 159, 183, 1),
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
