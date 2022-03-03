import 'package:flutter/cupertino.dart';
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
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: MessageService().getMessage(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snap) {
                if (snap.hasData) {
                  return _buildListView(snap);
                }
                return const Center(child: CupertinoActivityIndicator());
              },
            ),
          ),
          const MessageWritingLayout(),
        ],
      ),
    );
  }

  ListView _buildListView(AsyncSnapshot<QuerySnapshot<Object?>> snap) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        reverse: true,
        itemCount: snap.data!.docs.length,
        itemBuilder: (ctx, index) {
          Map<String, dynamic> map =
              snap.data!.docs[index].data() as Map<String, dynamic>;
          Message message = Message.fromJson(map);
          bool isEqual = message.sender! == AdminData.id;
          return Align(
            alignment: isEqual ? Alignment.centerLeft : Alignment.centerRight,
            child: isEqual
                ? NinePatch.left(message.message!)
                : NinePatch.right(message.message!),
          );
        });
  }
}
