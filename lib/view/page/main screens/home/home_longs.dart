import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/const/my_vo_fo_icons.dart';
import 'package:my_vofo/view/widgets/longs.dart';

import '../../../../calls/Like/GetVoiceRecords.dart';
import '../../../../models/Voice.dart';

class HomeLongs extends StatefulWidget {
  const HomeLongs({super.key});
  @override
  State<HomeLongs> createState() => _HomeLongState();

}

class _HomeLongState extends State<HomeLongs> {
  late List<Voice> _voiceRecords = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchVoiceRecords();
    print('home init ');
  }

  _fetchVoiceRecords () async {
    List<Voice> voiceRecords = await getVoice();
    print('_fetch voice records');
    // print(voiceRecords.first.voice_record);
    setState(() {
      _voiceRecords= voiceRecords;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: this._voiceRecords.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Longs();
            // Column(
            //   children: [
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     Longs(),
            //   ],
            // );
          }
          return Longs(
            isPromoted: true,
          );
        });
  }
}
