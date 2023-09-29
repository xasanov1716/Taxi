class RequestModelDriver {
  RequestModelDriver({
    required this.userId,
    required this.fromId,
    required this.toId,
    required this.description,
    required this.requestPrice,
    required this.emptyPlaces,
    required this.tripTime,
    required this.createdAt,
  });

  RequestModelDriver.initial()
      : this(
          userId: '',
          fromId: 0,
          toId: 0,
          description: '',
          requestPrice: 0,
          emptyPlaces: 0,
          tripTime: '',
          createdAt: 0,
        );

  RequestModelDriver copyWith({
    String? userId,
    int? fromId,
    int? toId,
    String? description,
    int? requestPrice,
    int? emptyPlaces,
    String? tripTime,
    int? createdAt,
  }) =>
      RequestModelDriver(
        userId: userId ?? this.userId,
        fromId: fromId ?? this.fromId,
        toId: toId ?? this.toId,
        description: description ?? this.description,
        requestPrice: requestPrice ?? this.requestPrice,
        emptyPlaces: emptyPlaces ?? this.emptyPlaces,
        tripTime: tripTime ?? this.tripTime,
        createdAt: createdAt ?? this.createdAt,
      );

  factory RequestModelDriver.fromJson(Map<String, dynamic> json) =>
      RequestModelDriver(
        userId: json['user_id'] as String? ?? '',
        fromId: json['from_id'] as int? ?? 0,
        toId: json['to_id'] as int? ?? 0,
        description: json['description'] as String? ?? '',
        requestPrice: json['request_price'] as int? ?? 0,
        emptyPlaces: json['empty_places'] as int? ?? 0,
        tripTime: json['trip_time'] as String? ?? '',
        createdAt: json['created_at'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'from_id': fromId,
        'to_id': toId,
        'description': description,
        'request_price': requestPrice,
        'empty_places': emptyPlaces,
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
 emptyPlaces: $emptyPlaces
 tripTime: $tripTime
 createdAt: $createdAt
    ''';
  }

  final String userId;
  final int fromId;
  final int toId;
  final String description;
  final int requestPrice;
  final int emptyPlaces;
  final String tripTime;
  final int createdAt;
}
