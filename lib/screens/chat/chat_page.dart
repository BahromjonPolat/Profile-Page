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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const ChatPageAppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: List.generate(45, (index) {
              return Align(
                alignment: index % 2 == 0
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: index % 2 == 0 ? NinePatch.right() : NinePatch.left(),
              );
            }),
          )),
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

  @override
  void dispose() {
    super.dispose();
  }

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
