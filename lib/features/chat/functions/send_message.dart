import 'package:notekey_app/features/chat/domain/chat_message.dart';
import 'package:notekey_app/features/chat/domain/chat_repository.dart';

class SendMessage {
  final ChatRepository repo;
  SendMessage(this.repo);

  Future<void> call({
    required String id,
    required String chatId,
    required String senderId,
    required String text,
    DateTime? sentAt,
  }) {
    return repo.sendMessage(ChatMessage(
      id: id,
      chatId: chatId,
      senderId: senderId,
      text: text,
      sentAt: sentAt ?? DateTime.now(),
    ));
  }
}
