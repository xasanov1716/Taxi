class DistrictModel {
  int id;
  int regionId;
  String name;

  DistrictModel({required this.id, required this.regionId, required this.name});

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      id: json['id'] as int,
      regionId: json['region_id'] as int,
      name: json['name'] as String,
    );
  }
}
