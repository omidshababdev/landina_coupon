import 'dart:convert';
import 'dart:ffi';

class CouponModel {
  final String id;
  final String userId;
  final String name;
  final String desc;
  final String location;

  CouponModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.desc,
    required this.location,
  });

  factory CouponModel.fromJson(Map<String, dynamic> map) {
    return CouponModel(
      id: map['_id'] ?? ' ',
      userId: map['userId'] ?? ' ',
      name: map['name'] ?? ' ',
      desc: map['desc'] ?? ' ',
      location: map['location'] ?? ' ',
    );
  }
}
