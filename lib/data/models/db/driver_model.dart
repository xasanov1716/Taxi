class DriverModel {
  final String driverId;
  final String fcmToken;
  final String fullName;
  final String createdAt;
  final String birthDate;
  final String phoneNumber;
  final String telegramLink;
  final String email;
  final String gender;
  final String imageUrl;
  final String currentLocation;
  final String fromToText;
  final int from;
  final int to;
  final int emptyPlaces;
  final String aboutDriver;
  final String carModel;
  final String passangerType;
  final int price;
  final bool hasDelivery;
  final bool hasRoofTop;
  final bool isOnline;
  final String lastOnlineTime;
  final double longitude;
  final double latitide;
  final bool hasFilled;
  final String carNumber;

  DriverModel({
    required this.driverId,
    required this.fcmToken,
    required this.fullName,
    required this.createdAt,
    required this.birthDate,
    required this.phoneNumber,
    required this.telegramLink,
    required this.email,
    required this.gender,
    required this.imageUrl,
    required this.currentLocation,
    required this.fromToText,
    required this.from,
    required this.to,
    required this.emptyPlaces,
    required this.aboutDriver,
    required this.carModel,
    required this.passangerType,
    required this.price,
    required this.hasDelivery,
    required this.hasRoofTop,
    required this.isOnline,
    required this.lastOnlineTime,
    required this.longitude,
    required this.latitide,
    required this.hasFilled,
    required this.carNumber,
  });

  DriverModel copyWith({
    String? driverId,
    String? fcmToken,
    String? fullName,
    String? createdAt,
    String? birthDate,
    String? phoneNumber,
    String? telegramLink,
    String? email,
    String? gender,
    String? imageUrl,
    String? currentLocation,
    String? fromToText,
    int? from,
    int? to,
    int? emptyPlaces,
    String? aboutDriver,
    String? carModel,
    String? passangerType,
    int? price,
    bool? hasDelivery,
    bool? hasRoofTop,
    bool? isOnline,
    String? lastOnlineTime,
    double? longitude,
    double? latitide,
    bool? hasFilled,
    String? carNumber,
  }) =>
      DriverModel(
        driverId: driverId ?? this.driverId,
        fcmToken: fcmToken ?? this.fcmToken,
        fullName: fullName ?? this.fullName,
        createdAt: createdAt ?? this.createdAt,
        birthDate: birthDate ?? this.birthDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        telegramLink: telegramLink ?? this.telegramLink,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        imageUrl: imageUrl ?? this.imageUrl,
        currentLocation: currentLocation ?? this.currentLocation,
        fromToText: fromToText ?? this.fromToText,
        from: from ?? this.from,
        to: to ?? this.to,
        emptyPlaces: emptyPlaces ?? this.emptyPlaces,
        aboutDriver: aboutDriver ?? this.aboutDriver,
        carModel: carModel ?? this.carModel,
        passangerType: passangerType ?? this.passangerType,
        price: price ?? this.price,
        hasDelivery: hasDelivery ?? this.hasDelivery,
        hasRoofTop: hasRoofTop ?? this.hasRoofTop,
        isOnline: isOnline ?? this.isOnline,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
        longitude: longitude ?? this.longitude,
        latitide: latitide ?? this.latitide,
        hasFilled: hasFilled ?? this.hasFilled,
        carNumber: carNumber ?? this.carNumber,
      );

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        driverId: json["driver_id"] as String? ?? "",
        fcmToken: json["fcm_token"],
        fullName: json["full_name"],
        createdAt: json["created_at"],
        birthDate: json["birth_date"],
        phoneNumber: json["phone_number"],
        telegramLink: json["telegram_link"],
        email: json["email"],
        gender: json["gender"],
        imageUrl: json["image_url"],
        currentLocation: json["current_location"],
        fromToText: json["from_to_text"],
        from: json["from"],
        to: json["to"],
        emptyPlaces: json["empty_places"],
        aboutDriver: json["about_driver"],
        carModel: json["car_model"],
        passangerType: json["passanger_type"],
        price: json["price"],
        hasDelivery: json["has_delivery"],
        hasRoofTop: json["has_roof_top"],
        isOnline: json["is_online"],
        lastOnlineTime: json["last_online_time"],
        longitude: json["longitude"],
        latitide: json["latitide"],
        hasFilled: json["has_filled"],
        carNumber: json["car_number"],
      );

  Map<String, dynamic> toJson() => {
        "driverId": driverId,
        "fcmToken": fcmToken,
        "fullName": fullName,
        "created_at": createdAt,
        "birthDate": birthDate,
        "phoneNumber": phoneNumber,
        "telegramLink": telegramLink,
        "email": email,
        "gender": gender,
        "imageUrl": imageUrl,
        "currentLocation": currentLocation,
        "fromToText": fromToText,
        "from": from,
        "to": to,
        "emptyPlaces": emptyPlaces,
        "aboutDriver": aboutDriver,
        "carModel": carModel,
        "passangerType": passangerType,
        "price": price,
        "hasDelivery": hasDelivery,
        "hasRoofTop": hasRoofTop,
        "isOnline": isOnline,
        "lastOnlineTime": lastOnlineTime,
        "longitude": longitude,
        "latitide": latitide,
        "hasFilled": hasFilled,
        "carNumber": carNumber,
      };

  @override
  String toString() {
    return """
    "driverId": $driverId,
    "fcmToken": $fcmToken,
    "fullName": $fullName,
    "created_at": $createdAt,
    "birthDate": $birthDate,
    "phoneNumber": $phoneNumber,
    "telegramLink": $telegramLink,
    "email": $email,
    "gender": $gender,
    "imageUrl": $imageUrl,
    "currentLocation": $currentLocation,
    "fromToText": $fromToText,
    "from":$from,
    "to":$to,
    "emptyPlaces": $emptyPlaces,
    "aboutDriver": $aboutDriver,
    "carModel": $carModel,
    "passangerType": $passangerType,
    "price": $price,
    "hasDelivery": $hasDelivery,
    "hasRoofTop": $hasRoofTop,
    "isOnline": $isOnline,
    "lastOnlineTime": $lastOnlineTime,
    "longitude": $longitude,
    "latitide": $latitide,
    "hasFilled": $hasFilled,
    "carNumber": $carNumber,
    """;
  }
}

