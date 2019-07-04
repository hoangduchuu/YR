import 'dart:convert';

class ImageEntity {
  String fieldname;
  String originalname;
  String encoding;
  String mimetype;
  String destination;
  String filename;
  String path;
  int size;

  ImageEntity({
    this.fieldname,
    this.originalname,
    this.encoding,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
  });

  factory ImageEntity.fromJson(String str) =>
      ImageEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageEntity.fromMap(Map<String, dynamic> json) => new ImageEntity(
        fieldname: json["fieldname"] == null ? null : json["fieldname"],
        originalname:
            json["originalname"] == null ? null : json["originalname"],
        encoding: json["encoding"] == null ? null : json["encoding"],
        mimetype: json["mimetype"] == null ? null : json["mimetype"],
        destination: json["destination"] == null ? null : json["destination"],
        filename: json["filename"] == null ? null : json["filename"],
        path: json["path"] == null ? null : json["path"],
        size: json["size"] == null ? null : json["size"],
      );

  Map<String, dynamic> toMap() => {
        "fieldname": fieldname == null ? null : fieldname,
        "originalname": originalname == null ? null : originalname,
        "encoding": encoding == null ? null : encoding,
        "mimetype": mimetype == null ? null : mimetype,
        "destination": destination == null ? null : destination,
        "filename": filename == null ? null : filename,
        "path": path == null ? null : path,
        "size": size == null ? null : size,
      };

  @override
  String toString() {
    return 'ImageEntity{fieldname: $fieldname, originalname: $originalname, encoding: $encoding, mimetype: $mimetype, destination: $destination, filename: $filename, path: $path, size: $size}';
  }
}
