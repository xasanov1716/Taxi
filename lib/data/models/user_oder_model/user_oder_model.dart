class UserRoleModel {
  final String driver;
  final String client;

  UserRoleModel({
    required this.driver,
    required this.client,
  });

  UserRoleModel copyWith({
    String? driver,
    String? client,
  }) =>
      UserRoleModel(
        driver: driver ?? this.driver,
        client: client ?? this.client,
      );

  factory UserRoleModel.fromJson(Map<String, dynamic> json) => UserRoleModel(
        driver: json['driver'] as String? ?? '',
        client: json['client'] as String? ?? '',
      );

  @override
  String toString() => '''
    driver: $driver,
    client: $client,

  ''';

  Map<String, dynamic> toJson() => {
        'driver': driver,
        'client': client,
      };
}
