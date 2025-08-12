// Egal für welche Datenbank wir uns entscheiden,
// unsere App braucht diese Methoden, um Nachrichten,
// Posts, Events, Freundeslisten und Benachrichtigungen zu verwalten.

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

class Post {
  final String id;
  final String authorId;
  final String content;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.authorId,
    required this.content,
    required this.timestamp,
  });
}

class Event {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });
}

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

abstract class DatabaseRepository {
  // CHAT NACHRICHTEN

  /// sendMessage = Nachricht erstellen (senden)
  void sendMessage(ChatMessage message);

  /// getMessages = Nachrichten lesen (empfangen)
  List<ChatMessage> getMessages();

  /// updateMessage = Nachricht ändern
  void updateMessage(ChatMessage message);

  /// deleteMessage = Nachricht löschen
  void deleteMessage(String messageId);

  // POSTS

  /// createPost = Beitrag erstellen
  void createPost(Post post);

  /// getPosts = Beiträge lesen
  List<Post> getPosts();

  /// updatePost = Beitrag ändern
  void updatePost(Post post);

  /// deletePost = Beitrag löschen
  void deletePost(String postId);

  // EVENTS

  /// createEvent = Veranstaltung erstellen
  void createEvent(Event event);

  /// getEvents = Veranstaltungen lesen
  List<Event> getEvents();

  /// updateEvent = Veranstaltung ändern
  void updateEvent(Event event);

  /// deleteEvent = Veranstaltung löschen
  void deleteEvent(String eventId);

  // FREUNDESLISTEN

  /// addFriend = Freund hinzufügen
  void addFriend(String userId, String friendId);

  /// getFriends = Freundesliste lesen
  List<String> getFriends(String userId);

  /// removeFriend = Freund entfernen
  void removeFriend(String userId, String friendId);

  // BENACHRICHTIGUNGEN

  /// createNotification = Benachrichtigung erstellen
  void createNotification(Notification notification);

  /// getNotifications = Benachrichtigungen lesen
  List<Notification> getNotifications(String userId);

  /// deleteNotification = Benachrichtigung löschen
  void deleteNotification(String notificationId);
}
