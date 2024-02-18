import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client/models/chat_message_model.dart';
import 'package:client/repository/chat_repo.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatNewPrompt>(chatNewPrompt);
    on<ChatNewContentGeneratedEvent>(chatNewContentGeneratedEvent);
  }

  StreamSubscription<http.Response>? _subscription;
  List<ChatMessage> cachedMessages = [];

  Future<void> chatNewPrompt(
      ChatNewPrompt event, Emitter<ChatState> emit) async {
    emit(ChatNewMessageGeneratingLoadingState());

    try {
      cachedMessages.add(ChatMessage(role: 'user', content: event.prompt));
      emit(ChatNewMessageGeneratedState());
      cachedMessages.add(const ChatMessage(role: 'assistant', content: ""));
      _subscription?.cancel();
      _subscription = getBotResponseRepo(cachedMessages).listen((event) {
        for (String line in event.body.split('\n')) {
          String jsonDataString = line.replaceFirst("data:", "");
          Map<String, dynamic> data = jsonDecode(jsonDataString.trim());
          add(ChatNewContentGeneratedEvent(data['data']));
          log(data['data']);
        }
      });
    } catch (e) {
      log(event.toString());
      emit(ChatNewMessageGeneratingErrorState());
    }
  }

  Future<void> chatNewContentGeneratedEvent(
      ChatNewContentGeneratedEvent event, Emitter<ChatState> emit) async {
    try {
      ChatMessage modelMessage = cachedMessages.last;
      String content = event.content;
      cachedMessages.last = ChatMessage(
          role: 'assistant', content: modelMessage.content + content);
      emit(ChatNewMessageGeneratedState());
    } catch (e) {
      log(e.toString());
    }
  }
}
