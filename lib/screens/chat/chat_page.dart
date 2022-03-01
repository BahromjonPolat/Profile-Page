import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => MessageProvider(),
      builder: (ctx, w) {
        return _buildScaffold();
      },
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: const ChatPageAppBar(),
      body: Column(
        children:const [
          Expanded(child: Center(child: Text("Message"))),
          MessageWritingLayout(),
        ],
      ),
    );
  }
}
