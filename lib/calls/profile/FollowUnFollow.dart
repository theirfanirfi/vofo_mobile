import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import '../../models/Conversation.dart';
import '../../models/Profile.dart';

var dio = Dio();

Future<String> FollowUnFollow(String username) async {

  final response = await http
      .get(Uri.parse(API_CONFIG.getAPIBaseURL()+'follow/'+username),
      headers: <String, String> {
        "Content-Type": "application/json",
        "Authorization": VofoStorage().getToken(),
      },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print(response.body);
    return response.body.toString();

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return throw Exception(response.body);
  }
}