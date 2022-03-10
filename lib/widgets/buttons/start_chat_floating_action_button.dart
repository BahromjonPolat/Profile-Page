import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/admin_panel/screens/admin_panel_page.dart';
import 'package:profile/core/components/exporting_packages.dart';
// import 'dart:developer' as developer;

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
      if (user.uid == AdminData.id) {
        CustomNavigator().push(const AdminPanelPage());
      } else {
        CustomNavigator().push(const ChatPage());
      }
    } else {
      CustomNavigator().push(const AuthPage());
    }
  }
}
