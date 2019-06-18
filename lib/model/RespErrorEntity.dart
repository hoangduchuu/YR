import 'package:equatable/equatable.dart';

//{
//"name": "BadRequest",
//"message": "Cast to ObjectId failed for value \"5c9a0243a6151b1603bcad7b1\" at path \"_id\" for model \"posts\"",
//"code": 400,
//"className": "bad-request",
//"errors": {}
//}
class ErrorEntity {
  String name, message, className;
  int code;
  ErrorEntity({this.name, this.message, this.className, this.code});

  factory ErrorEntity.fromJson(Map<String, dynamic> raw){
    return ErrorEntity(
        name: raw['name'],
        message: raw['message'],
        code: raw['code'],
        className: raw['className']
    );
  }

  factory ErrorEntity.fromJSON(Map<String, dynamic> raw){
    return ErrorEntity(
        name: raw['name'],
        message: raw['message'],
        code: raw['code'],
        className: raw['className']
    );
  }

  @override
  String toString() {
    return 'ErrorEntity{name: $name, message: $message, className: $className, code: $code}';
  }


}