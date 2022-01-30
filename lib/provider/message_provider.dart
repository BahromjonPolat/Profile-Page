import 'package:flutter/material.dart';
import 'package:profile/core/data/mock_messages.dart';

class MessageProvider extends ChangeNotifier {
  final TextEditingController _messageController = TextEditingController();

  void sendMessage() {
    String message = _messageController.text.trim();
    print(message);
    if (message.isEmpty) {
      return;
    }
    MockMessages.messages.add(message);
    print(message);
    _messageController.clear();
    notifyListeners();
  }

  TextEditingController get messageController => _messageController;
}