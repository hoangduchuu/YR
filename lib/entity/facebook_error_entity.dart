// To parse this JSON data, do
//
//     final faceBookRequestErrorEntity = faceBookRequestErrorEntityFromJson(jsonString);

import 'dart:convert';

class FaceBookRequestErrorEntity {
  String name;
  String message;
  int code;
  String className;
  Errors errors;

  FaceBookRequestErrorEntity({
    this.name,
    this.message,
    this.code,
    this.className,
    this.errors,
  });

  factory FaceBookRequestErrorEntity.fromJson(String str) => FaceBookRequestErrorEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FaceBookRequestErrorEntity.fromMap(Map<String, dynamic> json) => new FaceBookRequestErrorEntity(
    name: json["name"] == null ? null : json["name"],
    message: json["message"] == null ? null : json["message"],
    code: json["code"] == null ? null : json["code"],
    className: json["className"] == null ? null : json["className"],
    errors: json["errors"] == null ? null : Errors.fromMap(json["errors"]),
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "message": message == null ? null : message,
    "code": code == null ? null : code,
    "className": className == null ? null : className,
    "errors": errors == null ? null : errors.toMap(),
  };

  @override
  String toString() {
    return 'FaceBookRequestErrorEntity{name: $name, message: $message, code: $code, className: $className, errors: $errors}';
  }


}

class Errors {
  dynamic phone;

  Errors({
    this.phone,
  });

  factory Errors.fromJson(String str) => Errors.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Errors.fromMap(Map<String, dynamic> json) => new Errors(
    phone: json["phone"] == null ? null : Phone.fromMap(json["phone"]),
  );

  Map<String, dynamic> toMap() => {
    "phone": phone == null ? null : phone.toMap(),
  };
}

class Phone {
  String message;
  String name;
  Properties properties;
  String kind;
  String path;

  Phone({
    this.message,
    this.name,
    this.properties,
    this.kind,
    this.path,
  });

  factory Phone.fromJson(String str) => Phone.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Phone.fromMap(Map<String, dynamic> json) => new Phone(
    message: json["message"] == null ? null : json["message"],
    name: json["name"] == null ? null : json["name"],
    properties: json["properties"] == null ? null : Properties.fromMap(json["properties"]),
    kind: json["kind"] == null ? null : json["kind"],
    path: json["path"] == null ? null : json["path"],
  );

  Map<String, dynamic> toMap() => {
    "message": message == null ? null : message,
    "name": name == null ? null : name,
    "properties": properties == null ? null : properties.toMap(),
    "kind": kind == null ? null : kind,
    "path": path == null ? null : path,
  };
}

class Properties {
  String message;
  String type;
  String path;

  Properties({
    this.message,
    this.type,
    this.path,
  });

  factory Properties.fromJson(String str) => Properties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Properties.fromMap(Map<String, dynamic> json) => new Properties(
    message: json["message"] == null ? null : json["message"],
    type: json["type"] == null ? null : json["type"],
    path: json["path"] == null ? null : json["path"],
  );

  Map<String, dynamic> toMap() => {
    "message": message == null ? null : message,
    "type": type == null ? null : type,
    "path": path == null ? null : path,
  };
}

class NewFacebookRegisterEntity{}
