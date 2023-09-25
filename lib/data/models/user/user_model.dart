
class UserModel {
  final String image;
  final String fullName;
  final String nickName;
  final String userId;
  final String fcmToken;
  final String createdAt;
  final String addressText;
  final String emailAddress;
  final String birthDate;
  final String phone;
  final String gender;

  UserModel(
      {required this.image,
      required this.fullName,
      required this.nickName,
      required this.emailAddress,
      required this.birthDate,
      required this.phone,
      required this.addressText,
      required this.createdAt,
      required this.fcmToken,
      required this.userId,
      required this.gender, 
      });

  UserModel copyWith({
    String? fullName,
    String? nickName,
    String? emailAddress,
    String? phone,
    String? image,
    String? gender,
    String? addressText,
    String? fcmToken,
    String? createdAt,
    String? userId,
    String? birthDate,
  }) =>
      UserModel(
        image: image ?? this.image,
        fullName: fullName ?? this.fullName,
        nickName: nickName ?? this.nickName,
        emailAddress: emailAddress ?? this.emailAddress,
        birthDate: birthDate ?? this.birthDate,
        phone: phone ?? this.phone,
        gender: gender ?? this.gender,
        addressText: addressText ?? this.addressText,
        fcmToken: fcmToken ?? this.fcmToken,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
      );

    factory UserModel.fromJson(Map<String, dynamic> json)=>UserModel(
      image: json['image'] as String? ??'',
      fullName: json['fullName'] as String? ??'',
      nickName: json['nickName'] as String? ??'',
      emailAddress: json['emailAddress'] as String? ??'',
      birthDate: json['birthDate'] as String? ??'',
      phone: json['phone'] as String? ??'',
      addressText: json['addressText'] as String? ??'',
      createdAt: json['createdAt'] as String? ??'',
      fcmToken: json['fcmToken'] as String? ??'',
      userId: json['userId'] as String? ??'',
      gender: json['gender'] as String? ??''
    );

    Map<String, dynamic> toJson()=>{
      'image' : image,
      'fullName':fullName,
      'nickName':nickName,
      'userId':userId,
      'fcmToken':fcmToken,
      'createdAt':createdAt,
      'addressText':addressText,
      'emailAddress':emailAddress,
      'birthDate':birthDate,
      'phone':phone,
      'gender':gender,
    };
}
