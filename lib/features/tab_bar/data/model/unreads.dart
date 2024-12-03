class Unread {
  final bool notification;
  final bool message;

  Unread({required this.notification, required this.message});

  factory Unread.fromJson(Map<String, dynamic> json) {
    return Unread(
      notification: json['notifications'],
      message: json['messages'],
    );
  }
}
