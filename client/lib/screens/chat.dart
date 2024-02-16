import 'package:client/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ChatBloc chatBloc = ChatBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('SmartChat'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.create))],
      ),
      drawer: const Drawer(),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(child: ListView()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      const Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: "Message SmartBot...",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send_rounded,
                          ))
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
