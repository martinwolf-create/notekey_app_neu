import 'package:notekey_app/features/chat/domain/chat_message.dart';
import 'package:notekey_app/features/chat/domain/chat_repository.dart';

class WatchMessages {
  final ChatRepository repo;
  WatchMessages(this.repo);

  Stream<List<ChatMessage>> call(String chatId) => repo.watchMessages(chatId);
}
