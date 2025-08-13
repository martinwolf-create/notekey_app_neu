import 'package:notekey_app/features/chat/domain/chat_message.dart';

abstract class ChatRepository {
  Future<void> sendMessage(ChatMessage message);
  Stream<List<ChatMessage>> watchMessages(String chatId);
  Future<List<ChatMessage>> getHistory(String chatId, {int limit = 50});
  Future<List<String>> fetchRecentChatIds({int limit = 10});
}
