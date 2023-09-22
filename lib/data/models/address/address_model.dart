class AddressModel {
  final String name;
  final String appartment;
  final double lat;
  final double long;


  AddressModel(
      {required this.name, required this.appartment, required this.lat, required this.long});

  factory AddressModel.fromJson(Map<String, dynamic> json)=>
      AddressModel(name: json['name'],
          appartment: json['appartment'],
          lat: json['lat'],
          long: json['long']);

  AddressModel copyWith({
    String? name,
    String? appartment,
    double? lat,
    double? long
  }) =>
      AddressModel(name: name ?? this.name,
          appartment: appartment ?? this.appartment,
          lat: lat ?? this.lat,
          long: long ?? this.long);
}


List<AddressModel> addres = [
  AddressModel(name: 'Home', appartment: '364 Stillwater Ave. Attleboro, MA 02703', lat: 43.42, long: 54.21),
  AddressModel(name: 'Office', appartment: '73 Virginia Rd. Cuyahoga Falls, OH 44221', lat: 43.42, long: 54.21),
  AddressModel(name: 'Mall Plaza', appartment: '55 Summerhouse Dr. Apopka, FL 32703', lat: 43.42, long: 54.21),
  AddressModel(name: 'Grand City Park', appartment: '26 State St. Daphne, AL 36526', lat: 43.42, long: 54.21),
  AddressModel(name: 'Town Square', appartment: ' 20 Applegate St. Hoboken, NJ 07030', lat: 43.42, long: 54.21),
  AddressModel(name: 'Bank', appartment: '917 W. Pine Street Easton, PA 18042', lat: 43.42, long: 54.21),
];