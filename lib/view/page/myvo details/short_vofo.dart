import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/models/Voice.dart';
import 'package:my_vofo/view/page/myvo%20details/short_detail.dart';
import 'package:my_vofo/view/page/share%20screens/share_screen.dart';
import 'package:my_vofo/view/widgets/audio_wave.dart';
import 'package:my_vofo/view/widgets/my_vos.dart';

class ShortVoFo extends StatelessWidget {
  final Voice voice;
  const ShortVoFo({required this.voice, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color.fromRGBO(59, 59, 59, 1)),
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
              title: Text(
                'MyVofo',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(59, 59, 59, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ShortDetail(voice: voice),
                  // MyVos(),
                  // MyVos(),
                  // MyVos(),
                  // MyVos(),
                ],
              ),
            )));
  }
}
