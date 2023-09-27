class UserRole {
  final String driver;
  final String client;

  UserRole({
    required this.driver,
    required this.client,
  });

  UserRole copyWith({
    String? driver,
    String? client,
  }) =>
      UserRole(
        driver: driver ?? this.driver,
        client: client ?? this.client,
      );

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
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
