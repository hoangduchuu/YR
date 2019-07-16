import 'dart:convert';

//{
//"name": "BadRequest",
//"message": "Cast to ObjectId failed for value \"5c9a0243a6151b1603bcad7b1\" at path \"_id\" for model \"posts\"",
//"code": 400,
//"className": "bad-request",
//"errors": {}
//}
String uploadEntityToJson(ErrorEntity data) => json.encode(data.toJson());

class ErrorEntity {
  String name, message, className;
  int code;
  dynamic errors;

  ErrorEntity({this.name, this.message, this.className, this.code, this.errors});

  factory ErrorEntity.fromJson(Map<String, dynamic> raw) {
    return ErrorEntity(
        name: raw['name'],
        message: raw['message'],
        code: raw['code'],
        errors: raw['errors'],
        className: raw['className']);
  }

  factory ErrorEntity.fromJSON(Map<String, dynamic> raw) {
    return ErrorEntity(
        name: raw['name'],
        message: raw['message'],
        code: raw['code'],
        errors: raw['errors'],
        className: raw['className']);
  }

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "message": message == null ? null : message,
        "code": code == null ? null : code,
        "className": className == null ? null : className,
        "errors": errors == null ? null : errors
      };

  @override
  String toString() {
    return 'ErrorEntity{name: $name, message: $message, className: $className, code: $code, errors: $errors}';
  }
}
