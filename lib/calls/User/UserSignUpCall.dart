import 'dart:convert';

import 'package:my_vofo/calls/API_Config.dart';
import 'package:my_vofo/models/User.dart';
import 'package:http/http.dart' as http;
Future<User> postUser(String name, String username, String password, String phone, String country_code) async {

  final response = await http
      .post(Uri.parse(API_CONFIG.getAPIBaseURL()+'auth/signup'),
      headers: <String, String> {
        "Content-Type": "application/json",
        "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YjI3Y2M2YzBhM2U3YWVhMjVkZDI0MyIsIm5hbWUiOiJpcmZhbiIsInVzZXJuYW1lIjoiaXJmYW4iLCJlbWFpbCI6ImlyZmFuQGdtYWlsLmNvbSIsImlhdCI6MTY4OTQxODk1MSwiZXhwIjoxNjg5NDIwNzUxfQ.1UQOsYy-WboHORgRoLd0JSKdpRkgMSapnX941pVM8F4",

      },
    body: jsonEncode(<String, String>{
      "name": name,
      "username": username,
      "email": "",
      "password": password,
      "phone": phone,
      "country_code": country_code
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