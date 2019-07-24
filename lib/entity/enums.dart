enum Gender { MALE, FEMALE }
enum Status { ACTIVE }
enum NotificationReadSTATUS { ACTIVE, READ }
enum Role { OWNER, ADMIN }
enum CouponStatus { ACTIVE, DRAFT, JEJECTED }

// enumpaping
final genderValues = new EnumValues({"male": Gender.MALE, "female": Gender.FEMALE});
final roleValues = new EnumValues({"admin": Role.ADMIN, "owner": Role.OWNER});
final statusValues = new EnumValues({"active": CouponStatus.ACTIVE});
final notificationReadStatusValue = new EnumValues(
  {
    "active": NotificationReadSTATUS.ACTIVE,
    "read": NotificationReadSTATUS.READ,
  },
);
final couponStatus = new EnumValues({
  "rejected": CouponStatus.ACTIVE,
  "draft": CouponStatus.DRAFT,
  "active": CouponStatus.ACTIVE,
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

enum TextFontStyle { BOLD, REGULAR }
