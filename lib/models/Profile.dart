import 'dart:convert';

import 'package:my_vofo/models/HandleException.dart';

class ProfileModel extends HandleException{
  String id = "";
  final String email;
  final String username;
  final int voiceRecords;
  final int followers;
  final int following;
  final bool isMyProfile;
  final String created_at;
  final String updated_at;

  ProfileModel(
      this.id,
      {
        required this.email,
        required this.username,
        required this.voiceRecords,
        required this.followers,
        required this.following,
        required this.isMyProfile,
        required this.created_at,
        required this.updated_at

      });

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      json['_id'],
      email: json['email'],
      username: json['username'],
      voiceRecords: json['voiceRecords'],
      followers: json['followers'],
      following: json['following'],
      isMyProfile: json['isMyProfile'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
