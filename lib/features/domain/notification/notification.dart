class Notification {
  final String id;
  final String userId;
  final String message;
  final DateTime timestamp;

  Notification({
    required this.id,
    required this.userId,
    required this.message,
    required this.timestamp,
  });
}
