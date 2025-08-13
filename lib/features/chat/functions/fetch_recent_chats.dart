import 'package:notekey_app/features/chat/domain/chat_repository.dart';

class FetchRecentChats {
  final ChatRepository repo;
  FetchRecentChats(this.repo);

  Future<List<String>> call({int limit = 10}) =>
      repo.fetchRecentChatIds(limit: limit);
}
