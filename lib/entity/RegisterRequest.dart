import 'dart:convert';

import 'package:your_reward_user/data/base/IsToJSON.dart';

/**
 * model for request body when register user
 */
class RegisterRequest implements IsToJSON {
  String email,
      role,
      fullName,
      password,
      confirmPasswrod,
      thumbnail,
      phone,
      gender,
      status;

  RegisterRequest(
      {this.email,
      this.role,
      this.fullName,
      this.password,
      this.confirmPasswrod,
      this.thumbnail,
      this.phone,
      this.gender,
      this.status});

  @override
  String toString() {
    return 'RegisterEntity{email: $email, role: $role, fullName: $fullName,'
        ' password: $password, confirm_passwrod: $confirmPasswrod, thumbnail:'
        ' $thumbnail, phone: $phone, gender: $gender, status: $status}';
  }

  @override
  String toJSON() {
    Map<String, dynamic> raw = new Map();
    raw['email'] = this.email;
    raw['role'] = this.role;
    raw['fullname'] = this.fullName;
    raw['password'] = this.password;
    raw['confirmPasswrod'] = this.confirmPasswrod;
    raw['thumbnail'] = this.thumbnail;
    raw['phone'] = this.phone;
    raw['gender'] = this.gender;
    raw['status'] = this.status;
    return jsonEncode(raw);
  }
}
