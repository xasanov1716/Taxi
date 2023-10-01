class RequestModelClient {
  RequestModelClient(
      {required this.userId,
        required this.fromId,
        required this.toId,
        required this.description,
        required this.requestPrice,
        required this.passengerCount,
        required this.tripTime,
        required this.createdAt});

  RequestModelClient.initial()
      : this(
      userId: '',
      fromId: 0,
      toId: 0,
      description: '',
      requestPrice: 0,
      passengerCount: 0,
      tripTime: '',
      createdAt: 0,
  );

  RequestModelClient copyWith({
    String? userId,
    int? fromId,
    int? toId,
    String? description,
    int? requestPrice,
    int? passengerCount,
    String? tripTime,
    int? createdAt,
  }) =>
      RequestModelClient(
        userId: userId ?? this.userId,
        fromId: fromId ?? this.fromId,
        toId: toId ?? this.toId,
        description: description ?? this.description,
        requestPrice: requestPrice ?? this.requestPrice,
        passengerCount: passengerCount ?? this.passengerCount,
        tripTime: tripTime ?? this.tripTime,
        createdAt: createdAt ?? this.createdAt,
      );

  factory RequestModelClient.fromJson(Map<String, dynamic> json) =>
      RequestModelClient(
        userId: json['user_id'] as String? ?? '',
        fromId: json['from_id'] as int? ?? 0,
        toId: json['to_id'] as int? ?? 0,
        description: json['description'] as String? ?? '',
        requestPrice: json['request_price'] as int? ?? 0,
        passengerCount: json['passenger_count'] as int? ?? 0,
        tripTime: json['trip_time'] as String? ?? '',
        createdAt: json['created_at'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'from_id': fromId,
    'to_id': toId,
    'description': description,
    'request_price': requestPrice,
    'passenger_count': passengerCount,
    'trip_time': tripTime,
    'created_at': createdAt,
  };

  @override
  String toString() {
    return '''
 userId: $userId
 fromId: $fromId
 toId: $toId
 description: $description
 requestPrice: $requestPrice
 emptyPlaces: $passengerCount
 tripTime: $tripTime
 createdAt: $createdAt
    ''';
  }

  final String userId;
  final int fromId;
  final int toId;
  final String description;
  final int requestPrice;
  final int passengerCount;
  final String tripTime;
  final int createdAt;
}
