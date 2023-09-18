import 'package:my_vofo/models/HandleException.dart';

class User extends HandleException{
  final String id = "";
  final String name;
  final String username;
  final String email;
  // final String password;
  final String phone;
  final String country_code;
  final String token;
  // final bool is_verified;
  // final bool is_password_reset_request;
  // final bool is_otp_generated;
  // final bool is_active;
  // final bool is_deleted;
  // final String otp_code;
  final String created_at;
  final String updated_at;

  User(
      {
      required this.name,
      required this.username,
        required this.email,
        // required this.password,
        required this.phone,
        required this.country_code,
        required this.token,
        // required this.is_verified,
        // required this.is_active,
        // required this.is_deleted,
        // required this.is_password_reset_request,
        // required this.is_otp_generated,
        // required this.otp_code,
        required this.created_at,
        required this.updated_at});

  factory User.fromJson(Map<String, dynamic> jsond){
    var json = jsond['user'];
    print('json');
    // print(json['_id'].toString());
    return User(
      // id: json['_id'].toString(),
      name: json['name'],
      username: json['username'],
      email: json['email'],
      // password: json['password'],
      phone: json['phone'],
      country_code: json['country_code'],
      token: json['token'],
      // is_verified: json['is_verified'],
      // is_active: json['is_active'],
      // is_deleted: json['is_deleted'],
      // is_password_reset_request: json['is_password_reset_request'],
      // is_otp_generated: json['is_otp_generated'],
      // otp_code: json['otp_code'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  toJSONEncodable() {
    Map<String, dynamic> json = new Map();

    json['name'] = name;
    json['username'] = username;
    json['email'] = email;
    json['phone'] = phone;
    json['country_code'] = country_code;
    json['token'] = token;
    json['created_at'] = created_at;

    return json;
  }

  static toUserObject(JSONEncodedUser){
    print('jsonencoded');
    print(JSONEncodedUser);
    return User(
      name: JSONEncodedUser['name'],
      username: JSONEncodedUser['username'],
      email: JSONEncodedUser['email'],
      phone: JSONEncodedUser['phone'],
      country_code: JSONEncodedUser['country_code'],
      token: JSONEncodedUser['token'],
      created_at: JSONEncodedUser['created_at'],
      updated_at: ''
    );
  }
}
