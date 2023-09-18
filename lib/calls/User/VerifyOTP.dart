import 'dart:convert';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:my_vofo/models/User.dart';
import 'package:http/http.dart' as http;
Future<User> verifyOTP(String otp_code, String token) async {

  final response = await http
      .post(Uri.parse(API_CONFIG.getAPIBaseURL()+'auth/verify_otp'),
      headers: <String, String> {
        "Content-Type": "application/json",
        "Authorization": token,

      },
    body: jsonEncode(<String, String>{
      "otp_code": otp_code,
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