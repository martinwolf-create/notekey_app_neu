import 'package:notekey_app/features/chat/domain/chat_message.dart';
import 'package:notekey_app/features/chat/domain/chat_repository.dart';

class GetChatHistory {
  final ChatRepository repo;
  GetChatHistory(this.repo);

  Future<List<ChatMessage>> call(String chatId, {int limit = 50}) =>
      repo.getHistory(chatId, limit: limit);
}
