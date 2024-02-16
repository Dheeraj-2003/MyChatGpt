import 'dart:ffi';

import 'package:client/bloc/chat_bloc.dart';
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
    final controller = TextEditingController();
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
              chatBloc.cachedMessages.isEmpty
                  ? const Spacer()
                  : const SizedBox(),
              chatBloc.cachedMessages.isEmpty
                  ? Center(
                      child: Column(children: [
                        Image.asset(
                          'assets/robot.png',
                          width: 60,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Ask me anything ...",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.white, fontSize: 17),
                        )
                      ]),
                    )
                  : Expanded(
                      child: ListView.builder(
                      reverse: true,
                      itemCount: chatBloc.cachedMessages.length,
                      itemBuilder: (context, index) {
                        index = chatBloc.cachedMessages.length - index - 1;
                        return Container(
                          margin: const EdgeInsets.all(6),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: chatBloc.cachedMessages[index].role ==
                                    'assistant'
                                ? Colors.white.withOpacity(0.1)
                                : Colors.transparent,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: chatBloc.cachedMessages[index].role ==
                                        'user'
                                    ? const Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundColor: Colors.red,
                                          ),
                                          Text(
                                            'U',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      )
                                    : Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                              radius: 16,
                                              child: Image.asset(
                                                "assets/robot.png",
                                                color: Colors.white,
                                                fit: BoxFit.scaleDown,
                                                width: 22,
                                              )),
                                        ],
                                      ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    chatBloc.cachedMessages[index].content,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              chatBloc.cachedMessages.isEmpty
                  ? const Spacer()
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: "Message SmartBot...",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      )),
                      IconButton(
                          onPressed: () {
                            if (controller.text.isNotEmpty) {
                              chatBloc.add(ChatNewPrompt(controller.text));
                              controller.clear();
                            }
                          },
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
