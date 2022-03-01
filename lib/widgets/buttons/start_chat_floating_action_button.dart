import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';

class StartChatButton extends StatelessWidget {
  const StartChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onPressed,
      child: const Icon(CupertinoIcons.chat_bubble_2),
    );
  }

  void _onPressed() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CustomNavigator().push(const ChatPage());
    } else {
      CustomNavigator().push(const AuthPage());
    }
  }
}
