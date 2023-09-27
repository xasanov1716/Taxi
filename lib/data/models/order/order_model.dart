class OrderModel {
  final String orderId;
  final String clientId;
  final String driverId;
  final String fromLocation;
  final String toLocation;
  final int orderPrice;
  final String createdAt;
  final String orderStatus;


  OrderModel({
    required this.orderId,
    required this.clientId,
    required this.driverId,
    required this.fromLocation,
    required this.toLocation,
    required this.orderPrice,
    required this.createdAt,
    required this.orderStatus
  });


  factory OrderModel.fromJson(Map<String, dynamic> json)=>OrderModel(
      orderId: json['order_id'] as String? ??'',
      clientId: json['client_id'] as String? ??'',
      driverId: json['driver_id'] as String? ??'',
      fromLocation: json['from_location'] as String? ??'',
      toLocation: json['to_location'] as String? ??'',
      orderPrice: json['order_price'] as int? ?? 0,
      createdAt: json['created_at'] as String? ??'',
      orderStatus: json['order_status'] as String? ??''
    );

  OrderModel copyWith({
    String? orderId,
    String? clientId,
    String? driverId,
    String? fromLocation,
    String? toLocation,
    int? orderPrice,
    String? createdAt,
    String? orderStatus,
  })=>OrderModel(
    orderId: orderId ?? this.orderId,
    clientId: clientId ?? this.clientId,
    driverId: driverId ?? this.driverId,
    fromLocation: fromLocation ?? this.fromLocation,
    toLocation: toLocation ?? this.toLocation,
    orderPrice: orderPrice ?? this.orderPrice,
    createdAt: createdAt ?? this.createdAt,
    orderStatus: orderStatus ?? this.orderStatus
  );

  @override
  String toString()=>'''
    orderId: $orderId,
    clientId: $clientId,
    driverId: $driverId,
    fromLocation: $fromLocation,
    toLocation: $toLocation,
    orderPrice: $orderPrice,
    createdAt: $createdAt,
    orderStatus: $orderStatus,
  ''';

  Map<String, dynamic> toJson()=>{
    'order_id':orderId,
    'client_id':clientId,
    'driver_id':driverId,
    'from_location': fromLocation,
    'to_location':toLocation,
    'order_price':orderPrice,
    'created_at':createdAt,
    'order_status':orderStatus,
  };

}