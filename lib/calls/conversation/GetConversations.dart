import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_vofo/storage/VofoStorage.dart';
import '../../models/Conversation.dart';

var dio = Dio();

Future<List<Conversation>> getConversations() async {

  final response = await http
      .get(Uri.parse(API_CONFIG.getAPIBaseURL()+'conversation/'),
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
    List<Conversation> conversationsList = [];
    if(re['status']){
      var conversations = re['conversations'];
      // print(conversations);
      conversations.forEach((v){
        // print('v');
        // print(v);
        conversationsList.add(Conversation.fromJson(v));

      });
      return conversationsList;
    }else {
      return throw Exception(response.body);
    }

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return throw Exception(response.body);
  }
}