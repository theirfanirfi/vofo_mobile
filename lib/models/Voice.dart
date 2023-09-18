import 'dart:convert';

import 'package:my_vofo/models/HandleException.dart';
import 'package:my_vofo/models/User.dart';

class Voice extends HandleException{
  String id = "";
  final User user;
  final String voice_record;
  final String hash_tags;
  final bool is_long;
  final bool is_short;
  final bool is_mention;
  final String created_at;
  final String updated_at;
  final int shares;
  final int likes;
  final int listens;

  Voice(
      this.id,
      {
        required this.user,
        required this.voice_record,
        required this.hash_tags,
        required this.is_long,
        required this.is_short,
        required this.is_mention,
        required this.shares,
        required this.likes,
        required this.listens,
        required this.created_at,
        required this.updated_at

      });

  factory Voice.fromJson(Map<String, dynamic> jsond){
    var json = jsond['user'];
    // print('json');
    // print(json['_id'].toString());
    // var jUser = json['user'];
    return Voice(
      json['_id'],

      user: User.fromJson(json),
      voice_record: json['voice_record'],
      hash_tags: json['hash_tags'],
      is_long: json['is_long'],
      is_short: json['is_short'],
      is_mention: json['is_mention'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      likes: json['likes'],
      shares: json['shares'],
      listens: json['listens'],
    );
  }

  static List<Voice> toList(String jsond){
    List<Voice> voicelist = List<Voice>.from(jsonDecode(jsond));
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

    return voicelist;
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
