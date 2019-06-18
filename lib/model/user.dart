class User {
  String id;
  String gender;
  String status;
  String role;
  int points;
  bool isNotificationEmail;
  bool isNotificationApplication;
  bool isNotificationPromotion;
  bool isNotificationEvent;
  bool isProfile;
  String email;
  String fullname;
  String thumbnail;
  String phone;
  String address;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  User({
    this.id,
    this.gender,
    this.status,
    this.role,
    this.points,
    this.isNotificationEmail,
    this.isNotificationApplication,
    this.isNotificationPromotion,
    this.isNotificationEvent,
    this.isProfile,
    this.email,
    this.fullname,
    this.thumbnail,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    id: json["_id"],
    gender: json["gender"],
    status: json["status"],
    role: json["role"],
    points: json["points"],
    isNotificationEmail: json["isNotificationEmail"],
    isNotificationApplication: json["isNotificationApplication"],
    isNotificationPromotion: json["isNotificationPromotion"],
    isNotificationEvent: json["isNotificationEvent"],
    isProfile: json["isProfile"],
    email: json["email"],
    fullname: json["fullname"],
    thumbnail: json["thumbnail"],
    phone: json["phone"],
    address: json["address"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "gender": gender,
    "status": status,
    "role": role,
    "points": points,
    "isNotificationEmail": isNotificationEmail,
    "isNotificationApplication": isNotificationApplication,
    "isNotificationPromotion": isNotificationPromotion,
    "isNotificationEvent": isNotificationEvent,
    "isProfile": isProfile,
    "email": email,
    "fullname": fullname,
    "thumbnail": thumbnail,
    "phone": phone,
    "address": address,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };

  @override
  String toString() {
    return 'User{id: $id, gender: $gender, status: $status, role: $role, points: $points, isNotificationEmail: $isNotificationEmail, isNotificationApplication: $isNotificationApplication, isNotificationPromotion: $isNotificationPromotion, isNotificationEvent: $isNotificationEvent, isProfile: $isProfile, email: $email, fullname: $fullname, thumbnail: $thumbnail, phone: $phone, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }


}
