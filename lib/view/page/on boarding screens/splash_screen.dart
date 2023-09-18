import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/on_boarding.dart';

import '../../../storage/VofoStorage.dart';
import '../main screens/home_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      var user = await VofoStorage().getUserFromStorage();
      print(user);
      if(user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }else {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => OnBoarding())));
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Image(image: AssetImage(ImageData.Logo), fit: BoxFit.contain,),
            ),
            LoadingAnimationWidget.waveDots(
              color: Color.fromRGBO(0, 159, 183, 1),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}