//abstract class HMapper<MODEL, ENTITY> {
//
//  HMapper(){
//    ENTITY mapToEntity(MODEL model);
//
//    MODEL maptoModel(ENTITY entity);
//  }
//  List<ENTITY> mapToEnties(List<MODEL> models) {
//    var entities = List<ENTITY>();
//    if (models != null) {
//      models.forEach((it) {
//        ENTITY entity = mapToEntity(it);
//        entities.add(entity);
//      });
//    }
//    return entities;
//  }
//
//  List<MODEL> mapToModels(List<ENTITY> entities) {
//    var models = List<MODEL>();
//    if (entities != null) {
//      entities.forEach((it) {
//        MODEL model = maptoModel(it);
//        models.add(model);
//      });
//    }
//    return models;
//  }
//
//
//}
