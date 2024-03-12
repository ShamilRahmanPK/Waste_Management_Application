import 'package:cloud_firestore/cloud_firestore.dart';

class ShopModel {
  String? name;
  String? email;
  String? uid;
  DateTime? createdAt;
  int? status;
  String? address;
  String? wardNo;
  String? phone;
  String? location;
  String?shopNo;
  String?pass;
  String?type;

  ShopModel({
    this.name,
    this.email,
    this.pass,
    this.uid,
    this.createdAt,
    this.status,
    this.type,
    this.address,
    this.wardNo,
    this.phone,
    this.location,
    this.shopNo
  });

  factory ShopModel.fromMap(Map<String, dynamic> map){
    return ShopModel(
        name : map['name'],
        email : map['email'],
        uid : map['uid'],
        createdAt : (map['createdAt'] as Timestamp?)?.toDate(),
        status : map['status'],
        address : map['address'],
        wardNo : map['wardNo'],
        phone : map['phone'],
        location : map['location'],
        pass: map['pass'],
        type: map['type'],
        shopNo: map['shopno']
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'createdAt': createdAt,
      'status': status,
      'address': address,
      'wardNo': wardNo,
      'phone': phone,
      'location': location,

    };
  }
}
