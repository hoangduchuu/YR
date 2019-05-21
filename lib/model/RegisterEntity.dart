import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:your_reward_user/data/base/IsToJSON.dart';

//model {
//	"email": "john.doe@example.com",
//	"role": "client",
//	"fullname": "John Doe",
//	"password": "john.doe",
//	"confirm_password": "john.doe",
//	"thumbnail": "http://example.com/user.png",
//	"phone": "123456789",
//	"gender": "male",
//	"address": "123456789",
//	"status": "active"
//}

class RegisterEntity implements IsToJSON{
  String email, role, fullName, password, confirmPasswrod, thumbnail, phone,
  gender, status;

  RegisterEntity({this.email, this.role, this.fullName, this.password, this.confirmPasswrod,
  this.thumbnail, this.phone, this.gender, this.status});

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
    raw['role'] = this.fullName;
    raw['password'] = this.password;
    raw['confirmPasswrod'] = this.confirmPasswrod;
    raw['thumbnail'] = this.thumbnail;
    raw['phone'] = this.phone;
    raw['gender'] = this.gender;
    raw['status'] = this.status;
    return jsonEncode(raw);
  }


}