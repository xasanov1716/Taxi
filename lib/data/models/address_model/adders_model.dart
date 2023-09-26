class AddressModel {
  final String addressText;
  final String id;
  final double longitude;
  final double latitide;

  AddressModel({
    required this.addressText,
    required this.id,
    required this.longitude,
    required this.latitide,
  });

  AddressModel copyWith({
    String? addressText,
    String? id,
    double? longitude,
    double? latitide,
  }) =>
      AddressModel(
        addressText: addressText ?? this.addressText,
        id: id ?? this.id,
        longitude: longitude ?? this.longitude,
        latitide: latitide ?? this.latitide,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressText: json['address_text'] as String? ?? '',
        id: json['fullName'] as String? ?? '',
        longitude: json['longitude'] as double? ?? 0,
        latitide: json['latitide'] as double? ?? 0,
      );

  @override
  String toString() => '''
    addressText: $addressText,
    id: $id,
    longitude: $longitude,
    latitide: $latitide,
  ''';

  Map<String, dynamic> toJson() => {
        'addressText': addressText,
        'id': id,
        'longitude': longitude,
        'latitide': latitide,
      };
}
