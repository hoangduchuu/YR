import 'package:your_reward_user/data/YRService.dart';
import 'package:your_reward_user/entity/RegisterEntity.dart';
import 'package:your_reward_user/entity/SignupEntity.dart';
import 'package:your_reward_user/entity/userEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class User {
  String fullName;
  String id;
  String phone;
  String adress;
  String email;
  String createAt;
  String _avatar;


  String get avatar => this._avatar;

  set avatar(String value) {
    this._avatar = '${YRService.END_POINT}/$value';
  }

  @override
  String toString() {
    return 'USER_model{fullName: $fullName, id: $id, phone: $phone, adress: $adress , Email $email}';
  }
}

class UserMapper extends BaseMapper<User, UserEntity> {
  @override
  User mapFrom(UserEntity entity) {
    var model = User();
    model.id = entity.id;
    model.phone = entity.phone;
    model.adress = entity.address;
    model.email = entity.email;
    model.fullName = entity.fullname;
    model.createAt = entity.createdAt.toString();
    model.avatar = entity.thumbnail;
    return model;
  }

  @override
  UserEntity mapTo(User model) {
    var entity = UserEntity();
    entity.id = model.id;
    entity.phone = model.phone;
    entity.address = model.adress;
    entity.fullname = model.fullName;
  }
}

class UserRegisterMapper extends BaseMapper<User, SignupEntity> {
  @override
  User mapFrom(SignupEntity entity) {
    User user = new User();
    user.fullName = entity.fullname;
    user.email = entity.email;
    user.phone = entity.phone;
    user.id = entity.id;
    user.adress = "no";
    return user;
  }

  @override
  SignupEntity mapTo(User model) {}
}
