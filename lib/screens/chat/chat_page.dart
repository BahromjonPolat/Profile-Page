import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/widgets/chat_page_app_bar.dart';
import 'package:profile/widgets/message_writing_layout.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: ChatPageAppBar(),
      body: Column(
        children: [
          Expanded(child: ListView()),
          MessageWritingLayout(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
