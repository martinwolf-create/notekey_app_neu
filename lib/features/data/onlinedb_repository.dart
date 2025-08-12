import 'package:notekey_app/features/data/notekey_db.dart';

class OnlinedbRepository implements DatabaseRepository {
  @override
  ChatMessage? byId(String id) {
    // TODO: implement byId
    throw UnimplementedError();
  }

  @override
  ChatMessage create(ChatMessage draft) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  void delete(String id) {
    // TODO: implement delete
  }

  @override
  // TODO: implement items
  List<ChatMessage> get items => throw UnimplementedError();

  @override
  void update(ChatMessage updated) {
    // TODO: implement update
  }
}
