class AddressModel {
  final String addressText;
  final String apartment;
  final double lat;
  final double long;
  final String orientation;


  AddressModel(
      {required this.addressText, required this.orientation,
        required this.lat, required this.long,required this.apartment});

  factory AddressModel.fromJson(Map<String, dynamic> json)=>
      AddressModel(
          addressText: json['address_text'],
          orientation:json['orientation'],
          lat: json['lat'],
          long: json['long'],
          apartment: json['apartment']
      );

  AddressModel copyWith({
    String? addressText,
    String? orientation,
    String? apartment,
    double? lat,
    double? long
  }) =>
      AddressModel(
          addressText: addressText ?? this.addressText,
          orientation:orientation ?? this.orientation,
          apartment: apartment ?? this.apartment,
          lat: lat ?? this.lat,
          long: long ?? this.long);
}


List<AddressModel> addresses = [
  AddressModel(apartment: 'Home', orientation:'364 Stillwater Ave. Attleboro, MA 02703', lat: 43.42, long: 54.21, addressText: ''),
  AddressModel(apartment: 'Office', orientation:'73 Virginia Rd. Cuyahoga Falls, OH 44221', lat: 43.42, long: 54.21, addressText: ''),
  AddressModel(apartment: 'Mall Plaza', orientation:'55 Summerhouse Dr. Apopka, FL 32703', lat: 43.42, long: 54.21, addressText: ''),
  AddressModel(apartment: 'Grand City Park', orientation:'26 State St. Daphne, AL 36526', lat: 43.42, long: 54.21, addressText: ''),
  AddressModel(apartment: 'Town Square', orientation:' 20 Applegate St. Hoboken, NJ 07030', lat: 43.42, long: 54.21, addressText: ''),
  AddressModel(apartment: 'Bank', orientation:'917 W. Pine Street Easton, PA 18042', lat: 43.42, long: 54.21, addressText: ''),
];