import 'package:flutter/material.dart';

class ChatInputLine extends StatelessWidget {
  const ChatInputLine({
    Key? key,
    // required this.onTextFieldChange,
    required this.controller,
    required this.onSendTap,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function() onSendTap;
  // final void Function(String? value) onTextFieldChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            // onChanged: onTextFieldChange,
            controller: controller,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 30,
            icon: Icon(Icons.send),
            onPressed: onSendTap,
          ),
        ),
      ],
    );
  }
}
