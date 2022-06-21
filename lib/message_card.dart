import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message_model.dart';

class MessageCardWidget extends StatelessWidget {
  const MessageCardWidget({
    super.key,
    required this.message,
    required this.onMessagePressed,
  });

  final Message message;
  final void Function() onMessagePressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onMessagePressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 10,
              ),
            ],
            border: Border.all(
              width: 3,
              color: Colors.black,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "От: ${message.user}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                'Дата: ${message.date} Время: ${message.time}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),),
              Text(
                message.text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),),
            ],
          ),
        ),
    );
  }
}
