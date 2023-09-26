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
      orderId: json['orderId'] as String? ??'',
      clientId: json['clientId'] as String? ??'',
      driverId: json['driverId'] as String? ??'',
      fromLocation: json['fromLocation'] as String? ??'',
      toLocation: json['toLocation'] as String? ??'',
      orderPrice: json['orderPrice'] as int? ?? 0,
      createdAt: json['createdAt'] as String? ??'',
      orderStatus: json['orderStatus'] as String? ??''
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
    'orderId':orderId,
    'clientId':clientId,
    'driverId':driverId,
    'fromLocation': fromLocation,
    'toLocation':toLocation,
    'orderPrice':orderPrice,
    'createdAt':createdAt,
    'orderStatus':orderStatus,
  };

}