import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/calls/User/VerifyOTP.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import 'package:my_vofo/view/page/main%20screens/home_screens.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/signup_complete.dart';
import 'package:my_vofo/view/widgets/alert_dialog.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../models/HandleException.dart';
import '../../../models/User.dart';

class OtpScreen extends StatefulWidget {
  final bool alreadySignIn;
  final User user;
  const OtpScreen({required this.alreadySignIn, required this.user, super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController OtpController = OtpFieldController();
  TextEditingController textController = TextEditingController();

  String text = '';
  late User fuser;

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
      OtpController.setValue(value, text.length - 1);
    });
    print(text.length - 1);
    print(text);
    // print(widget.user.token);
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 159, 183, 1),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Container(
                height: size.height * 0.85,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
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
                        height: size.height * 0.2,
                        child: Image(
                          image: AssetImage(ImageData.Otp),
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: Text(
                          'OTP Verification',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(0, 159, 183, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 22.0),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    overflow: TextOverflow.ellipsis),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'We\'ve sent a code to ',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(59, 59, 59, 1),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.user.country_code+" "+widget.user.phone,
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: Color.fromRGBO(0, 159, 183, 1),
                                      ),
                                    ),
                                  ),
                                ])),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter the code in that message.',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Color.fromRGBO(59, 59, 59, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 50,
                        style: TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        controller: OtpController,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        },
                      ),
                      NumericKeyboard(
                        onKeyboardTap: _onKeyboardTap,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        leftIcon: Icon(
                          Icons.done,
                          color: Color.fromRGBO(27, 27, 30, 1),
                        ),
                        leftButtonFn: () async {
                          try {
                          fuser = await verifyOTP(text, widget.user.token);
                          print(fuser);
                          (new VofoStorage()).saveToStorage(fuser);
                      Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (Route<dynamic> route) => false);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          }on Exception catch(e){
                            print('e');

                            var handling = HandleException.parseException(e.toString());
                            print(handling.status);
                            print(handling.message);
                            showAlertDialog(context, "Error", handling.message);
                            // Map<dynamic, dynamic> values = json.decode(e.toString().substring(11));
                            // print(values['message']);
                          }
                          print(text);
                          // (widget.alreadySignIn == false)
                              // ? Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) => SignUpComplete())))
                              // : Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (context) => HomeScreen()),
                              //     (Route<dynamic> route) => false);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        },
                        rightIcon: Icon(
                          Icons.backspace_outlined,
                          color: Color.fromRGBO(27, 27, 30, 1),
                        ),
                        rightButtonFn: () {
                          setState(() {
                            text = text.substring(0, text.length - 1);
                            OtpController.setValue("", text.length);
                            print('text');
                            print(text);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Didn’t receive OTP code? ',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14.0),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: (() {}),
                        child: Text(
                          'Resend OTP',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
