import 'package:your_reward_user/entity/userEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class User {
  String fullName;
  String id;
  String phone;
  String adress;

  @override
  String toString() {
    return 'USER_model{fullName: $fullName, id: $id, phone: $phone, adress: $adress}';
  }
}

class UserMapper extends BaseMapper<User, UserEntity> {
  @override
  User mapFrom(UserEntity entity) {
    var model = User();
    model.id = entity.id;
    model.phone = entity.phone;
    model.adress = entity.address;
    model.fullName = entity.fullname;
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
