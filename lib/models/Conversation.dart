import 'dart:convert';

import 'package:my_vofo/models/HandleException.dart';
import 'package:my_vofo/models/User.dart';

class Conversation extends HandleException{
  String id = "";
  final User userOneInfo;
  final User userTwoInfo;
  final String user_one;
  final String user_two;
  final bool amIuserOne;
  final String created_at;
  final String updated_at;

  Conversation(
      this.id,
      {
        required this.userOneInfo,
        required this.userTwoInfo,
        required this.user_one,
        required this.user_two,
        required this.amIuserOne,
        required this.created_at,
        required this.updated_at

      });

  factory Conversation.fromJson(Map<String, dynamic> json){
    Map<String, dynamic> userOne = {"user": json['userOneInfo'][0]};
    Map<String, dynamic> userTwo = {"user": json['userTwoInfo'][0]};
    return Conversation(
      json['_id'],

      userOneInfo: User.fromJson(userOne),
      userTwoInfo: User.fromJson(userTwo),
      amIuserOne: json['amIuserOne'],
      user_one: json['user_one'],
      user_two: json['user_two'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  static List<Conversation> toList(String jsond){
    List<Conversation> conversationlist = List<Conversation>.from(jsonDecode(jsond));
    // var json = jsond['user'];
    // print('json');
    // print(json['_id'].toString());
    // var voice = Voice(
    //   user_id: json['user_id'],
    //   voice_record: json['voice_record'],
    //   hash_tags: json['hash_tags'],
    //   is_long: json['is_long'],
    //   is_short: json['is_short'],
    //   is_mention: json['is_mention'],
    //   created_at: json['created_at'],
    //   updated_at: json['updated_at'],
    // );

    // voicelist.add(voice);

    return conversationlist;
  }

  // toJSONEncodable() {
  //   Map<String, dynamic> json = new Map();
  //
  //   json['name'] = name;
  //   json['username'] = username;
  //   json['email'] = email;
  //   json['phone'] = phone;
  //   json['country_code'] = country_code;
  //   json['token'] = token;
  //   json['created_at'] = created_at;
  //
  //   return json;
  // }

  // static toUserObject(JSONEncodedUser){
  //   print('jsonencoded');
  //   print(JSONEncodedUser);
  //   return User(
  //     name: JSONEncodedUser['name'],
  //     username: JSONEncodedUser['username'],
  //     email: JSONEncodedUser['email'],
  //     phone: JSONEncodedUser['phone'],
  //     country_code: JSONEncodedUser['country_code'],
  //     token: JSONEncodedUser['token'],
  //     created_at: JSONEncodedUser['created_at'],
  //     updated_at: ''
  //   );
  // }
}
