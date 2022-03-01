import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    String? id,
    String? userId,
    String? sender,
    String? receiver,
    String? message,
    String? time,
    bool? isRead,
  }) {
    _id = id;
    _userId = userId;
    _sender = sender;
    _receiver = receiver;
    _message = message;
    _time = time;
    _isRead = isRead;
  }

  Message.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _sender = json['sender'];
    _receiver = json['receiver'];
    _message = json['message'];
    _time = json['time'];
    _isRead = json['isRead'];
  }

  String? _id;
  String? _userId;
  String? _sender;
  String? _receiver;
  String? _message;
  String? _time;
  bool? _isRead;

  String? get id => _id;

  String? get userId => _userId;

  String? get sender => _sender;

  String? get receiver => _receiver;

  String? get message => _message;

  String? get time => _time;

  bool? get isRead => _isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['sender'] = _sender;
    map['receiver'] = _receiver;
    map['message'] = _message;
    map['time'] = _time;
    map['isRead'] = _isRead;
    return map;
  }
}
