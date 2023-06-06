import 'package:flutter/material.dart';
import 'package:pash_app/whatsapp_pages/inchart.dart';

import 'colors.dart';
import 'info.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 110, 47),
        title: Text(
         
          info[0]['name'].toString(),
          style: const TextStyle(color: Colors.white)
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call, color: Colors.white)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value == MenuItem.clearChats) {
                } else if (value == MenuItem.deleteChats) {
                } else if (value == MenuItem.block) {
                } else if (value == MenuItem.audioCall) {
                } else if (value == MenuItem.videoCall) {}
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: MenuItem.clearChats,
                      child: Text("Clear chats"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.deleteChats,
                      child: Text("Delete chats"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.block,
                      child: Text("Block contact"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.audioCall,
                      child: Text("Audio call"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.videoCall,
                      child: Text("Video call"),
                    ),
                  ])
        ],
      ),
       body: Column(
        children: [
          const Expanded(
            child: Inchat(),
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: mobileChatBoxColor,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.emoji_emotions, color: Colors.grey,),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.camera_alt, color: Colors.grey,),
                    Icon(Icons.attach_file, color: Colors.grey,),
                    Icon(Icons.money, color: Colors.grey,),
                  ],
                ),
              ),
              hintText: 'Type a message!',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
    
  }
}

enum MenuItem {
  clearChats,
  deleteChats,
  block,
  audioCall,
  videoCall,
}
