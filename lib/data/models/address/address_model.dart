class AddressModel {
  final String name;
  final String street;
  final String apartment;
  final double lat;
  final double long;


  AddressModel(
      {required this.name, required this.street,
        required this.lat, required this.long,required this.apartment});

  factory AddressModel.fromJson(Map<String, dynamic> json)=>
      AddressModel(
          name: json['name'],
          street:json['street'],
          lat: json['lat'],
          long: json['long'],
          apartment: json['apartment']
      );

  AddressModel copyWith({
    String? name,
    String? street,
    String? apartment,
    double? lat,
    double? long
  }) =>
      AddressModel(
          name: name ?? this.name,
          street:street ?? this.street,
          apartment: apartment ?? this.apartment,
          lat: lat ?? this.lat,
          long: long ?? this.long);
}


List<AddressModel> addres = [
  AddressModel(apartment: 'Home', street:'364 Stillwater Ave. Attleboro, MA 02703', lat: 43.42, long: 54.21, name: ''),
  AddressModel(apartment: 'Office', street:'73 Virginia Rd. Cuyahoga Falls, OH 44221', lat: 43.42, long: 54.21, name: ''),
  AddressModel(apartment: 'Mall Plaza', street:'55 Summerhouse Dr. Apopka, FL 32703', lat: 43.42, long: 54.21, name: ''),
  AddressModel(apartment: 'Grand City Park', street:'26 State St. Daphne, AL 36526', lat: 43.42, long: 54.21, name: ''),
  AddressModel(apartment: 'Town Square', street:' 20 Applegate St. Hoboken, NJ 07030', lat: 43.42, long: 54.21, name: ''),
  AddressModel(apartment: 'Bank', street:'917 W. Pine Street Easton, PA 18042', lat: 43.42, long: 54.21, name: ''),
];