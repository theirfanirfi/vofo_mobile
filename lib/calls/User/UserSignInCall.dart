import 'dart:convert';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:my_vofo/models/User.dart';
import 'package:http/http.dart' as http;
Future<User> signIn(String usernameOEmail, String password) async {

  final response = await http
      .post(Uri.parse(API_CONFIG.getAPIBaseURL()+'auth/signin'),
      headers: <String, String> {
        "Content-Type": "application/json",
      },
    body: jsonEncode(<String, String>{
      "username": usernameOEmail,
      "password": password,
    })
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return User.fromJson(jsonDecode(response.body.toString()));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return throw Exception(response.body);
  }
}