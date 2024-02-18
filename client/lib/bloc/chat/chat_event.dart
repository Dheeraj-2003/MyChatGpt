part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class ChatNewPrompt extends ChatEvent {
  ChatNewPrompt(this.prompt);
  final String prompt;
}

class ChatNewContentGeneratedEvent extends ChatEvent {
  ChatNewContentGeneratedEvent(this.content);
  final String content;
}
