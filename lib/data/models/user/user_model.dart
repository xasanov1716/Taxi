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
  final String role;
  final String password;

  UserModel({
    required this.image,
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
    required this.role,
    required this.password,
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
    String? role,
    String? password,
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
        role: role ?? this.role,
        password: password ?? this.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        image: json['image'] as String? ?? '',
        fullName: json['full_name'] as String? ?? '',
        nickName: json['nick_name'] as String? ?? '',
        emailAddress: json['email_address'] as String? ?? '',
        birthDate: json['birth_date'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        addressText: json['address_text'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        fcmToken: json['fcm_token'] as String? ?? '',
        userId: json['user_id'] as String? ?? '',
        gender: json['gender'] as String? ?? '',
        role: json['role'] as String? ?? '',
        password: json['password'] as String? ?? '',
      );

  @override
  String toString() => '''
    image: $image,
    fullName: $fullName,
    nickName: $nickName,
    userId: $userId,
    fcmToken: $fcmToken,
    createdAt: $createdAt,
    addressText: $addressText,
    emailAddress: $emailAddress,
    birthDate: $birthDate,
    phone: $phone,
    gender: $gender,
    role: $role,
    password: $password,
  ''';

  Map<String, dynamic> toJson() => {
        'image': image,
        'full_name': fullName,
        'nick_name': nickName,
        'user_id': userId,
        'fcm_token': fcmToken,
        'created_at': createdAt,
        'address_text': addressText,
        'email_address': emailAddress,
        'birth_date': birthDate,
        'phone': phone,
        'gender': gender,
        'role': role,
        'password': password,
      };
}
