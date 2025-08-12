import 'package:notekey_app/features/data/notekey_db.dart';

// Diese Mock-Datenbank dient nur zum Testen.
// Alle Daten werden nur im Speicher gehalten und gehen beim Neustart verloren.

abstract class DatabaseRepository {
  void sendMessage(String m);
  List<String> getMessages();
  void updateMessage(int index, String updatedMessage);
  void deleteMessage(int index);

  void sendFriendRequest(String user);
  List<String> getFriendRequests();

  void sendNotification(String notification);
  List<String> getNotifications();
}

class MockDatabaseRepository implements DatabaseRepository {
  // Nachrichten
  List<String> messages = [];

  // Freundschaftsanfragen
  List<String> friendRequests = [];

  // Benachrichtigungen
  List<String> notifications = [];

  // Hilfsmethode zur Indexprüfung
  bool isValidIndex(int index, List list) {
    // Prüft, ob der Index im erlaubten Bereich liegt
    return index >= 0 && index < list.length;
  }

  // Nachrichten
  @override
  void sendMessage(String m) {
    messages.add(m);
  }

  @override
  List<String> getMessages() {
    return messages;
  }

  @override
  void updateMessage(int index, String updatedMessage) {
    if (isValidIndex(index, messages)) {
      messages[index] = updatedMessage;
    }
  }

  @override
  void deleteMessage(int index) {
    if (isValidIndex(index, messages)) {
      messages.removeAt(index);
    }
  }

  // Freundschaftsanfragen
  @override
  void sendFriendRequest(String user) {
    friendRequests.add(user);
  }

  @override
  List<String> getFriendRequests() {
    return friendRequests;
  }

  // Benachrichtigungen
  @override
  void sendNotification(String notification) {
    notifications.add(notification);
  }

  @override
  List<String> getNotifications() {
    return notifications;
  }
}
