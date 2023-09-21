class RegionModel {
  int id;
  String name;

  RegionModel({required this.id, required this.name});

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
