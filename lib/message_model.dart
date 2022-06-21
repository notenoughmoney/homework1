import 'dart:math';

import 'package:flutter/cupertino.dart';

class Message {
  late String user;
  late String date;
  late String time;
  late String text;

  Message(this.user, this.text) {
    DateTime now = new DateTime.now();
    DateTime nowDate = new DateTime(now.year, now.month, now.day);
    date = nowDate.toString().replaceAll(" 00:00:00.000", "");
    print(date);
    DateTime nowTime = new DateTime(now.hour, now.minute, now.second);
    time = nowTime.toString().substring(2, 10);
  }
}
