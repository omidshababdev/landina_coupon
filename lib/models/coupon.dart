class CouponModel {
  String id;
  String userId;
  String name;
  String category;
  String desc;
  String code;
  String location;

  CouponModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.category,
    required this.desc,
    required this.code,
    required this.location,
  });

  factory CouponModel.fromJson(Map<String, dynamic> map) {
    return CouponModel(
      id: map['_id'],
      userId: map['userId'],
      name: map['name'],
      category: map['category'],
      desc: map['desc'],
      code: map['code'],
      location: map['location'],
    );
  }
}
