import 'package:flutter/material.dart';
import 'package:my_vofo/view/widgets/my_vos.dart';

import '../../../../calls/Like/GetVoiceRecords.dart';
import '../../../../models/Voice.dart';

class HomeMyVos extends StatefulWidget {
  @override
  State<HomeMyVos> createState() => _HomeMyVosState();
}

class _HomeMyVosState extends State<HomeMyVos> {

  @override  late List<Voice> _voiceRecords = [];

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


  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(

        itemCount: this._voiceRecords.length,
        itemBuilder: (context, index) {
          // if (index == 1) {
            return MyVos(
              isThread: true,
              voice: this._voiceRecords[index],
            );
          // } else if (index == 0) {
          //   // return MyVos();
          //   // Column(
          //   //   children: [
          //   //     const SizedBox(
          //   //       height: 15,
          //   //     ),
          //   //     MyVos()
          //   //   ],
          //   // );
          // }
          // return MyVos();
        });
  }
}
