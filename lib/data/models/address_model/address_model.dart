class AddressModel {
  final String userId;
  final String addressText;
  final String addressId;
  final double longitude;
  final double latitude;
  final String apartment;
  final String orientation;
  final String userType;

  AddressModel(
      {required this.userId,
      required this.addressText,
      required this.addressId,
      required this.longitude,
      required this.latitude,
      required this.apartment,
      required this.orientation,
      required this.userType});

  AddressModel copyWith(
          {String? userId,
          String? addressText,
          String? addressId,
          double? longitude,
          double? latitude,
          String? apartment,
          String? orientation,
          String? userType}) =>
      AddressModel(
          userId: userId ?? this.userId,
          addressText: addressText ?? this.addressText,
          addressId: addressId ?? this.addressId,
          longitude: longitude ?? this.longitude,
          latitude: latitude ?? this.latitude,
          apartment: apartment ?? this.apartment,
          orientation: orientation ?? this.orientation,
          userType: userType ?? this.userType);

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        userId: json['user_id'] as String? ?? '',
        addressText: json['address_text'] as String? ?? '',
        addressId: json['addressId'] as String? ?? '',
        longitude: json['longitude'] as double? ?? 0,
        latitude: json['latitude'] as double? ?? 0,
        apartment: json['apartment'] as String? ?? '',
        orientation: json['orientation '] as String? ?? '',
        userType: json['user_type '] as String? ?? '',
      );

  @override
  String toString() => '''
  userId: $userId,
    addressText: $addressText,
    addressId: $addressId,
    longitude: $longitude,
    latitude: $latitude,
    apartment: $apartment,
    orientation: $orientation,
    userType: $userType 
  ''';

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'address_text': addressText,
        'address_id': addressId,
        'longitude': longitude,
        'latitude': latitude,
        'apartment': apartment,
        'orientation': orientation,
        'user_type': userType
      };
}
