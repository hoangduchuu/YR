import 'package:your_reward_user/entity/StoreEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class Store {
  String name;
  String owner;
  String address;
  String phone;
  String storeLogo;
}

class StoreMapper extends BaseMapper<Store, StoreEntity> {
  @override
  Store mapFrom(StoreEntity entity) {
    Store model = Store();
    model.storeLogo = entity.owner.ownerBackground;
    model.address = entity.address;
    model.owner = entity.owner.fullname;
    model.name = entity.owner.fullname;
    model.phone = entity.phone;
    return model;
  }

  @override
  StoreEntity mapTo(Store model) {
    StoreEntity entity = StoreEntity();
    entity.address = entity.address;
    entity.owner.fullname = model.name;
    entity.phone = model.phone;
    entity.thumbnail = model.storeLogo;
    return entity;
  }
}
