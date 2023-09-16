import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String image;
  final String fullName;
  final String nickName;
  final String emailAddress;
  final String date;
  final String phone;
  final String gender;

  UserModel({required this.image,required this.fullName,required this.nickName,required this.emailAddress,required this.date,required this.phone,required this.gender});

  UserModel copyWith({
    String? fullName,
    String? nickName,
    String? emailAddress,
    String? phone,
    String? image,
    String? gender,
    String? date,
  })=>UserModel(image: image ?? this.image, fullName: fullName ?? this.fullName, nickName: nickName ?? this.nickName, emailAddress: emailAddress ?? this.emailAddress, date: date ?? this.date, phone: phone ?? this.phone, gender: gender ?? this.gender);

}