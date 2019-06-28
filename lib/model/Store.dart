import 'package:your_reward_user/entity/StoreEntity.dart';
import 'package:your_reward_user/utils/BaseMapper.dart';

class Store {
  String ownerId;
  String name;
  String owner;
  String address;
  String phone;
  String storeLogo;
  String description;
  String addressLat;
  String addressLng;
  List<String> images;
}

class StoreMapper extends BaseMapper<Store, StoreEntity> {
  @override
  Store mapFrom(StoreEntity entity) {
    Store model = Store();
    model.storeLogo = entity.owner.ownerBackground;
    model.address = entity.address;
    model.ownerId = entity.ownerId;
    model.owner = entity.owner.fullname;
    model.name = entity.title;
    model.phone = entity.phone;
    model.description = entity.description;
    model.images = entity.images;
    model.addressLat = entity.addressLat;
    model.addressLng = entity.addressLng;
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
