import 'package:equatable/equatable.dart';

class RequestModel extends Equatable {
  final String userId;
  final int fromId;
  final int toId;
  final String description;
  final int requestPrice;
  final int passengerCount;
  final String tripTime;
  final String createdAt;
  final String creatorName;
  final int status;

  const RequestModel({
    required this.userId,
    required this.fromId,
    required this.toId,
    required this.description,
    required this.requestPrice,
    required this.passengerCount,
    required this.tripTime,
    required this.createdAt,
    required this.status,
    required this.creatorName,
  });

  const RequestModel.initial()
      : this(
          userId: '',
          fromId: 0,
          toId: 0,
          description: '',
          requestPrice: 0,
          passengerCount: 0,
          tripTime: '',
          createdAt: '',
          creatorName: "",
          status: 1,
        );

  RequestModel copyWith({
    String? userId,
    int? fromId,
    int? toId,
    String? description,
    int? requestPrice,
    int? passengerCount,
    String? tripTime,
    String? createdAt,
    String? creatorName,
    int? status,
  }) =>
      RequestModel(
        userId: userId ?? this.userId,
        fromId: fromId ?? this.fromId,
        toId: toId ?? this.toId,
        description: description ?? this.description,
        requestPrice: requestPrice ?? this.requestPrice,
        passengerCount: passengerCount ?? this.passengerCount,
        tripTime: tripTime ?? this.tripTime,
        createdAt: createdAt ?? this.createdAt,
        creatorName: creatorName ?? this.creatorName,
        status: status ?? this.status,
      );

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      RequestModel(
        userId: json['user_id'] as String? ?? '',
        fromId: json['from_id'] as int? ?? 0,
        toId: json['to_id'] as int? ?? 0,
        description: json['description'] as String? ?? '',
        requestPrice: json['request_price'] as int? ?? 0,
        passengerCount: json['passenger_count'] as int? ?? 0,
        tripTime: json['trip_time'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        creatorName: json['creator_name'] as String? ?? '',
        status: json['status'] as int? ?? 1,
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
        "creator_name": creatorName,
        "status": status,
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
 status: $status
 creatorName: $creatorName
    ''';
  }

  @override
  List<Object?> get props => [
        userId,
        fromId,
        toId,
        description,
        requestPrice,
        passengerCount,
        tripTime,
        createdAt,
      ];
}


enum RequestField {
  userId,
  fromId,
  toId,
  description,
  requestPrice,
  emptyPlaces,
  tripTime,
  createdAt,
}