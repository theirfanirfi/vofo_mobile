import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_vofo/calls/voice/GetVoiceRecords.dart';
import 'package:my_vofo/view/widgets/longs.dart';
import 'package:my_vofo/view/widgets/my_vos.dart';

import '../../../../models/Voice.dart';

class HomeAll extends StatefulWidget {
  const HomeAll({super.key});

  @override
  State<HomeAll> createState() => _HomeAllState();
}

class _HomeAllState extends State<HomeAll> {
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
    return SingleChildScrollView(
      child: (Column(
        children: List.generate(_voiceRecords.length,(index){
          if(_voiceRecords[index].is_short){
            print(base64Decode(_voiceRecords[index].voice_record));
            return MyVos(voice: _voiceRecords[index]);
          }else {
            return Text(_voiceRecords[index].id.toString());
          }
          })
        ,
      )),
    );
  }
}
