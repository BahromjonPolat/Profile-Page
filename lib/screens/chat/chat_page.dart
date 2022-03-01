import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/data/mock_messages.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    print('_ChatPageState.initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('_ChatPageState.dispose');
  }

  @override
  void activate() {
    super.activate();
    print('_ChatPageState.activate');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('_ChatPageState.deactivate');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('_ChatPageState.didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant ChatPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('_ChatPageState.didUpdateWidget');
  }
  @override
  void reassemble() {
    super.reassemble();
    print('_ChatPageState.reassemble');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('_ChatPageState.setState');
  }

  @override
  Widget build(BuildContext context) {
    List<String> messages = MockMessages.messages.reversed.toList();
    return ListenableProvider(
      create: (_) => MessageProvider(),
      builder: (ctx, w) {
        return _buildScaffold(messages);
      },
    );
  }

  Scaffold _buildScaffold(List<String> messages) {
    return Scaffold(
      appBar: const ChatPageAppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (ctx, i) {
                    String msg = messages[i];
                    return Align(
                      alignment: i % 2 == 0
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: i % 2 == 0
                          ? NinePatch.right(msg)
                          : NinePatch.left(msg),
                    );
                  })),
          const MessageWritingLayout(),
        ],
      ),
    );
  }

  Container _setLeft(String text) => Container(
        padding: MyEdgeInsets.all(12.0),
        margin: MyEdgeInsets.symmetric(h: 16.0, v: 12.0),
        constraints: const BoxConstraints(maxWidth: 340.0),
        color: Colors.white,
        child: Text(text),
      );

  String adfa = """
   @override
  Widget build(BuildContext context) {
    return Container(
      padding: MyEdgeInsets.symmetric(v: 16.0, h: 12.0),
      constraints: BoxConstraints(maxHeight: getHeight(79.0)),
      alignment: Alignment.bottomCenter,
      child: Row(
  """;
}
