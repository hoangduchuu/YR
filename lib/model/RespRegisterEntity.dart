import 'dart:convert';

import 'package:equatable/equatable.dart';



class RespRegisterEntity{
  String gender, status, role, id, email, fullName, thumbnail, phone, address, createdAt, updatedAt;
  int points;
  bool isNotificationEmail,  isNotificationApplication,
      isNotificationPromotion, isNotificationEvent, isProfile;


  RespRegisterEntity({this.gender, this.status, this.role, this.id,
      this.fullName, this.thumbnail, this.phone, this.address, this.createdAt, this.email,
      this.updatedAt, this.points, this.isNotificationEmail, this.isNotificationApplication,
      this.isNotificationPromotion, this.isNotificationEvent, this.isProfile});


  @override
  String toString() {
    return 'RespRegisterEntity{gender: $gender, status: $status, role: $role,'
        ' id: $id, fullName: $fullName, thumbnail: $thumbnail, phone: $phone,'
        ' address: $address, createdAt: $createdAt, updatedAt: $updatedAt,'
        ' points: $points, isNotificationEmail: $isNotificationEmail,'
        ' isNotificationPromotion: $isNotificationPromotion,'
        ' isNotificationEvent: $isNotificationEvent, isProfile: $isProfile}';
  }

  //{
//"gender": "male",
//"status": "active",
//"role": "client",
//"points": 0,
//"isNotificationEmail": true,
//"isNotificationApplication": true,
//"isNotificationPromotion": true,
//"isNotificationEvent": false,
//"isProfile": false,
//"_id": "5ce24df3474aed1f6ffea82b",
//"email": "john.doe@example.com",
//"fullname": "John Doe",
//"thumbnail": "http://example.com/user.png",
//"phone": "123456789",
//"address": "123456789",
//"createdAt": "2019-05-20T06:49:23.386Z",
//"updatedAt": "2019-05-20T06:49:23.386Z",
//"__v": 0
//}

factory RespRegisterEntity.fromJSON(Map<String, dynamic> map){
    return RespRegisterEntity(
      gender: map['gender'],
      status: map['status'],
      role: map['role'],
      points: map['points'],
      isNotificationEmail: map['isNotificationEmail'],
      isNotificationApplication: map['isNotificationApplication'],
      isNotificationPromotion: map['isNotificationPromotion'],
      isNotificationEvent: map['isNotificationEvent'],
      isProfile: map['isProfile'],
      id: map['id'],
      email: map['email'],
      thumbnail: map['thumbnail'],
      phone: map['phone'],
      address: map['address'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
}



}