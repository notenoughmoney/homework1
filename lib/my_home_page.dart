import 'package:flutter/material.dart';

import 'message_card.dart';
import 'message_model.dart';
import 'chat_input_line.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Message> messages = [];
  List users = ["Я", "Бот"];

  final controller = TextEditingController();

  @override
  void initState() {
    //messages.add(Message(users[0], controller.text));
    super.initState();
  }

  void onSendButtonTap() {
    messages.add(Message(users[0], controller.text));
    messages.add(Message(users[1], "Привет! \nЯ бот, который отвечает на все твои сообщения) \nТолько что ты написал: ${controller.text}"));
    print(controller.text); //это типа отправка
    controller.clear();
    setState(() {});
  }

  // void onTextFieldChange(String? value) {
  //   print(value);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: List.generate(
                messages.length,
                (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: MessageCardWidget(
                    message: messages[i],
                    onMessagePressed: () {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 3,
                )
              )
            ),
            height: 100,
            child: ChatInputLine(
              controller: controller,
              onSendTap: onSendButtonTap,
              // onTextFieldChange: onTextFieldChange,
            ),
          ),
        ],
      ),
    );
  }
}