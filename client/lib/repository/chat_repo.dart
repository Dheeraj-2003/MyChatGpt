import 'dart:convert';

import 'package:client/models/chat_message_model.dart';
import 'package:http/http.dart' as http;

Stream<http.Response> getBotResponseRepo(List<ChatMessage> messages) async* {
  List<Map> mappedMessages = [];
  for (int i = 0; i < messages.length; i++) {
    mappedMessages.add(messages[i].toMap());
  }

  http.Client client = http.Client();
  http.Request request = http.Request(
      'post', Uri.parse("http://3.82.127.22:3000/api/v1/generate_response"));
  request.headers['Accept'] = "text/event-stream";
  request.headers['Cache-Control'] = "no-cache";
  request.headers['Content-Type'] = "application/json";
  request.body = jsonEncode({"messages": mappedMessages});

  final response = await client.send(request);

  Stream<http.Response> mappedStream = response.stream
      .transform(utf8.decoder)
      .map((json) =>
          http.Response(json, response.statusCode, headers: response.headers));

  yield* mappedStream;
}
