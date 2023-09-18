import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/on_boarding_2.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/sign_in.dart';
import 'package:my_vofo/view/widgets/simple_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

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
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.5,
                    child: Image(
                      image: AssetImage(ImageData.OnBoarding),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Welcome to MyVoFo',
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
                      'Listen to what the world is saying right now .',
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
                    height: 25.0,
                  ),
                  SimpleButton(
                    backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                    text: 'Get Started',
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => OnBoarding2())));
                    },
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SimpleButton(
                    backgroundColor: Colors.white,
                    text: 'Sign In To Your Account',
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
