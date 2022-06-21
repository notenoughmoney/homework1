import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message_model.dart';

class MessageCardWidget extends StatelessWidget {
  MessageCardWidget({
    super.key,
    required this.message,
    required this.onMessagePressed,
  }) {
    this.color = (this.message.user == "Я") ? Colors.blue : Color.fromARGB(255, 54, 244, 79); 
  }

  var color;

  final Message message;
  final void Function() onMessagePressed;

  final dateTimeStyle = const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                        );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: onMessagePressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
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

          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
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
                        message.text,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ]
                  ),
                )
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Дата:',
                        style: dateTimeStyle,
                      ),
                      Text(
                        message.date,
                        style: dateTimeStyle,
                      ),
                      Text(
                        'Время:',
                        style: dateTimeStyle,
                      ),
                      Text(
                        message.time,
                        style: dateTimeStyle,
                      ),
                    ]
                  ),
                )
              ),
            ]
          )   
        ),
    );
  }
}
