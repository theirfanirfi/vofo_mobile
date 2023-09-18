import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import '../../models/Voice.dart';

var dio = Dio();

Future<String> postVoice(String record, bool is_long, bool is_short, bool is_mention, String hash_tags) async {

  final response = await http
      .post(Uri.parse(API_CONFIG.getAPIBaseURL()+'voice/'),
      headers: <String, String> {
        "Content-Type": "application/json",
        "Authorization": VofoStorage().getToken(),
      },
      body: jsonEncode(<String, dynamic>{
        "voice_record": record,
        "is_long": is_long,
        "is_short": is_short,
        "is_mention": is_mention,
        "hash_tags": hash_tags,
      })
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return response.body.toString();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return throw Exception(response.body);
  }
}