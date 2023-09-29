class NotificationModel {
  String title;
  String body;
  String iconCode;
  int timestamp;

  NotificationModel({
    required this.timestamp,
    required this.title,
    required this.body,
    required this.iconCode,
  });

  // NotificationModel.initial():this(
  //     title:'',
  //     body:'',
  //     iconCode:'',
  //     timestamp:0
  // );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'iconCode': iconCode,
      'timestamp': timestamp,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String? ?? '',
      body: map['body'] as String? ?? "",
      iconCode: map['iconCode'] as String,
      timestamp: map['timestamp'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  NotificationModel copyWith({
    String? title,
    String? body,
    String? iconCode,
    int? timestamp,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      body: body ?? this.body,
      iconCode: iconCode ?? this.iconCode,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
