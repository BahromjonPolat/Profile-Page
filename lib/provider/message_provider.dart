import 'package:flutter/material.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:uuid/uuid.dart';

class MessageProvider extends ChangeNotifier {
  final MessageService _messageService = MessageService();
  final TextEditingController _messageController = TextEditingController();
  final String _uid = FirebaseAuth.instance.currentUser!.uid;
  final Uuid _uuid = const Uuid();

  void sendMessage() {
    String msg = _messageController.text.trim();
    if (msg.isEmpty) {
      return;
    }
    Message message = Message(
      id: _uuid.v4(),
      userId: _uid,
      sender: _uid,
      receiver: AdminData.id,
      message: msg,
      isRead: false,
      sentTime: DateTime.now(),
    );
    _messageService.sendMessage(message);
    _messageController.clear();
    notifyListeners();
  }

  TextEditingController get messageController => _messageController;
}
