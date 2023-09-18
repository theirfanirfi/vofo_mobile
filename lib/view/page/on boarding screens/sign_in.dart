import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/calls/User/UserSignInCall.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/main%20screens/home_screens.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/sign_up.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';
import 'package:my_vofo/view/widgets/simple_text_form_field.dart';

import '../../../models/HandleException.dart';
import '../../../models/User.dart';
import '../../../storage/VofoStorage.dart';
import '../../widgets/alert_dialog.dart';

class SignIn extends StatefulWidget {

  @override
  State<SignIn> createState() => _SignIn();

}

class _SignIn extends State<SignIn> {
  // const _SignIn({super.key});
  String email = '';
  String password = '';
  late User fuser;
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
                    'Sign In',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Container(
                  //   width: size.width * 0.9,
                  //   child: Text(
                  //     'We are happy to see. You can continue to sign in for use our services',
                  //     style: GoogleFonts.inter(
                  //       textStyle: TextStyle(
                  //           color: Color.fromRGBO(89, 101, 111, 1),
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 17.0),
                  //     ),
                  //     textAlign: TextAlign.center,
                  //     maxLines: 3,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SimpleButton(
                    backgroundColor: Colors.white,
                    text: 'Sign In With Google',
                    textColor: Color.fromRGBO(89, 101, 111, 1),
                    borderColor: Color.fromRGBO(172, 169, 187, 1),
                    textImage: ImageData.Google,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SimpleButton(
                    backgroundColor: Colors.white,
                    text: 'Sign In With Apple',
                    textColor: Color.fromRGBO(89, 101, 111, 1),
                    borderColor: Color.fromRGBO(172, 169, 187, 1),
                    textImage: ImageData.Apple,
                    onPressed: () {},
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
                  SimpleTextFormField(
                    hintText: 'Using Phone, Email, or Username',
                      callBack: (val) => setState((){email = val;}),
                    obscureText: false,
                    maxLength: 30

                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SimpleTextFormField(
                      hintText: 'Password',
                      callBack: (val) => setState((){password = val;}),
                      obscureText: true,
                      isPassword: true,
                      maxLines: 1,
                      maxLength: 20

                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: 'Sign in',
                    textColor: Colors.white,
                    onPressed: () async {
                      print(email+" "+password);
                      try {
                        fuser = await signIn(email, password);
                        await VofoStorage().saveToStorage(fuser);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                            (Route<dynamic> route) => false);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        // VofoStorage().getUserFromStorage();
                      }on Exception catch(e){
                        print('e');

                        var handling = HandleException.parseException(e.toString());
                        print(handling.status);
                        print(handling.message);
                        showAlertDialog(context, "Error", handling.message);
                        // Map<dynamic, dynamic> values = json.decode(e.toString().substring(11));
                        // print(values['message']);
                      }
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(builder: (context) => HomeScreen()),
                      //     (Route<dynamic> route) => false);
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SimpleButton(
                    backgroundColor: Colors.white,
                    text: 'Forgot Password ?',
                    textColor: Color.fromRGBO(0, 159, 183, 1),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account? ',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontSize: 16.0),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SignUp())));
                        }),
                        child: Text(
                          'Sign Up',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
