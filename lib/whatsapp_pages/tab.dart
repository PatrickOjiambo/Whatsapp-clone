import 'package:flutter/material.dart';
import 'package:pash_app/whatsapp_pages/calls.dart';
import 'package:pash_app/whatsapp_pages/chats.dart';
import 'package:pash_app/whatsapp_pages/community.dart';
import 'package:pash_app/whatsapp_pages/groups.dart';
import 'package:pash_app/whatsapp_pages/status.dart';

class WhatsAppTab extends StatefulWidget {
  const WhatsAppTab({super.key});

  @override
  State<WhatsAppTab> createState() => _WhatsAppTabState();
}

class _WhatsAppTabState extends State<WhatsAppTab>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 43, 110, 47),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_rounded, color: Colors.white),
          ),
          PopupMenuButton<MenuItem>(
              color: Colors.white,
              onSelected: (value) {
                if (value == MenuItem.security) {
                } else if (value == MenuItem.linkedDevices) {
                } else if (value == MenuItem.privacy) {
                } else if (value == MenuItem.settings) {}
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: MenuItem.settings,
                      child: Text("security"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.linkedDevices,
                      child: Text("Linked devices"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.privacy,
                      child: Text("Privacy"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.settings,
                      child: Text("Settings"),
                    )
                  ])
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Icon(Icons.group_rounded, color: Colors.white),
            ),
            Tab(child: Text("Chats", style: TextStyle(color: Colors.white))),
            Tab(child: Text("Groups", style: TextStyle(color: Colors.white))),
            Tab(child: Text("Status", style: TextStyle(color: Colors.white))),
            Tab(child: Text("Calls", style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Community(),
          Chats(),
          Groups(),
          Status(),
          Calls()
        ],
      ),
    );
  }
}

enum MenuItem {
  privacy,
  security,
  linkedDevices,
  settings,
}
