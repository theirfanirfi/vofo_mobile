import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import '../../models/User.dart';
import '../../models/Voice.dart';

var dio = Dio();

Future<List<Voice>> getVoice() async {

  final response = await http
      .get(Uri.parse(API_CONFIG.getAPIBaseURL()+'voice/'),
      headers: <String, String> {
        "Content-Type": "application/json",
        "Authorization": VofoStorage().getToken(),
      },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print(response.body);
    var re = jsonDecode(response.body.toString());
    // print(re);
    List<Voice> voices = [];
    if(re['status']){
      var voice_records = re['voice_records'];
      voice_records.forEach((v){
        print(v['user']['name']);
        voices.add(Voice(v['_id'], user: User.fromJson(v), voice_record: v['voice_record'],
        hash_tags: v['hash_tags'], is_long: v['is_long'], is_short: v['is_short'],
            is_mention: v['is_mention'],
        created_at: v['created_at'], updated_at: v['updated_at'],
        likes: v['likes'], shares: v['shares'], listens: v['listens']));

      });
      return voices;
    }else {
      return throw Exception(response.body);
    }

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return throw Exception(response.body);
  }
}