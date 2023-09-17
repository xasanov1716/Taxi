class SearchHistoryModel {
  final int id;
  final String query;
  final int timestamp;

  SearchHistoryModel({
    required this.id,
    required this.query,
    required this.timestamp,
  });

  factory SearchHistoryModel.fromMap(Map<String, dynamic> map) {
    return SearchHistoryModel(
      id: map['id'] as int,
      query: map['query'] as String,
      timestamp: map['timestamp'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'query': query,
      'timestamp': timestamp,
    };
  }
}
