enum Gender { MALE }

final genderValues = new EnumValues({
  "male": Gender.MALE
});

enum Role { OWNER, ADMIN }

final roleValues = new EnumValues({
  "admin": Role.ADMIN,
  "owner": Role.OWNER
});

enum CouponStatus { ACTIVE }

final statusValues = new EnumValues({
  "active": CouponStatus.ACTIVE
});


class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}