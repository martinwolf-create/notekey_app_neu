class ChatMessage {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });
}
