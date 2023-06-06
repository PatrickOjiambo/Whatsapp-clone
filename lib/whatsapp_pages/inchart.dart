import 'package:flutter/material.dart';

import 'info.dart';
import 'my_mess.dart';
import 'other_guy.dart';

class Inchat extends StatefulWidget {
  const Inchat({super.key});

  @override
  State<Inchat> createState() => _InchatState();
}

class _InchatState extends State<Inchat> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (contex, index) {
        if (messages[index]['isMe'] == true) {
          return MyMessageCard(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        }
        return SenderMessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString());
      },
    );
  }
}
