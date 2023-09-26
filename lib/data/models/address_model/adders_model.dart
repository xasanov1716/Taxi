class AddressModel {
  final String addressText;
  final String addressId;
  final double longitude;
  final double latitude;

  AddressModel({
    required this.addressText,
    required this.addressId,
    required this.longitude,
    required this.latitude,
  });

  AddressModel copyWith({
    String? addressText,
    String? id,
    double? longitude,
    double? latitide,
  }) =>
      AddressModel(
        addressText: addressText ?? this.addressText,
        addressId: id ?? this.addressId,
        longitude: longitude ?? this.longitude,
        latitude: latitide ?? this.latitude,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressText: json['address_text'] as String? ?? '',
        addressId: json['fullName'] as String? ?? '',
        longitude: json['longitude'] as double? ?? 0,
        latitude: json['latitide'] as double? ?? 0,
      );

  @override
  String toString() => '''
    addressText: $addressText,
    id: $addressId,
    longitude: $longitude,
    latitide: $latitude,
  ''';

  Map<String, dynamic> toJson() => {
        'addressText': addressText,
        'id': addressId,
        'longitude': longitude,
        'latitide': latitude,
      };
}
