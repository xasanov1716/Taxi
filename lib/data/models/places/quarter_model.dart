
class QuarterModel {
  int id;
  int districtId;
  String name;

  QuarterModel({required this.id, required this.districtId, required this.name});

  factory QuarterModel.fromJson(Map<String, dynamic> json) {
    return QuarterModel(
      id: json['id'] as int,
      districtId: json['district_id'] as int,
      name: json['name'] as String,
    );
  }
}