import 'dart:async';
import 'package:notekey_app/features/chat/domain/chat_message.dart';
import 'package:notekey_app/features/chat/domain/chat_repository.dart';

class InMemoryChatRepository implements ChatRepository {
  final Map<String, List<ChatMessage>> _byChat = {};
  final Map<String, StreamController<List<ChatMessage>>> _controllers = {};
  final List<String> _recentChatIds = [];

  List<ChatMessage> _ensure(String chatId) =>
      _byChat.putIfAbsent(chatId, () => <ChatMessage>[]);

  StreamController<List<ChatMessage>> _ctrl(String chatId) =>
      _controllers.putIfAbsent(
          chatId, () => StreamController<List<ChatMessage>>.broadcast());

  void _touchRecent(String chatId) {
    _recentChatIds.remove(chatId);
    _recentChatIds.add(chatId);
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    final list = _ensure(message.chatId);
    if (list.any((m) => m.id == message.id)) return;
    list.add(message);
    list.sort((a, b) => a.sentAt.compareTo(b.sentAt));
    _touchRecent(message.chatId);
    _ctrl(message.chatId).add(List.unmodifiable(list));
  }

  @override
  Stream<List<ChatMessage>> watchMessages(String chatId) {
    _ctrl(chatId).add(List.unmodifiable(_ensure(chatId)));
    return _ctrl(chatId).stream;
  }

  @override
  Future<List<ChatMessage>> getHistory(String chatId, {int limit = 50}) async {
    final list = _ensure(chatId);
    final start = list.length > limit ? list.length - limit : 0;
    return List.unmodifiable(list.sublist(start));
  }

  @override
  Future<List<String>> fetchRecentChatIds({int limit = 10}) async {
    final reversed = List<String>.from(_recentChatIds.reversed);
    return reversed.take(limit).toList();
  }

  void dispose() {
    for (final c in _controllers.values) {
      c.close();
    }
  }
}
