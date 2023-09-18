import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import '../../models/Voice.dart';

var dio = Dio();

Future<Map<String, dynamic>> likeVoice(String vr_id) async {

  final response = await http
      .post(Uri.parse(API_CONFIG.getAPIBaseURL()+'voice/like/'+vr_id),
      headers: <String, String> {
        "Content-Type": "application/json",
        "Authorization": VofoStorage().getToken(),
      },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var json = jsonDecode(response.body.toString());
    print(json);
    return json;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return throw Exception(response.body);
  }
}