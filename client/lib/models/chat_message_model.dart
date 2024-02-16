class ChatMessage {
  const ChatMessage({required this.role, required this.content});
  final String role;
  final String content;

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
    };
  }
}
