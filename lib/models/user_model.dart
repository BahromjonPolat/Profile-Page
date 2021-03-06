import 'dart:convert';
import 'package:profile/core/data/device_info_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? _fullName;
  String? _email;
  String? _password;
  DateTime? _firstTime;
  DateTime? _lastAction;
  DateTime? _dateOfBirth;
  String? _id;
  String? _phone;
  String? _imgUrl;
  bool? _isOnline;
  dynamic _device;

  UserModel({
    String? fullName,
    String? email,
    String? password,
    DateTime? firstTime,
    DateTime? lastAction,
    DateTime? dateOfBirth,
    String? id,
    String? phone,
    String? imgUrl,
    bool? isOnline,
    dynamic device,
  }) {
    _fullName = fullName;
    _email = email;
    _password = password;
    _firstTime = firstTime;
    _lastAction = lastAction;
    _dateOfBirth = dateOfBirth;
    _id = id;
    _phone = phone;
    _imgUrl = imgUrl;
    _isOnline = isOnline;
    _device = device;
  }

  UserModel.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _email = json['email'];
    _password = json['password'];
    _firstTime = json['firstTime'].toDate();
    _lastAction = json['lastAction'].toDate();
    _dateOfBirth =
        // ignore: prefer_null_aware_operators
        json['dateOfBirth'] != null ? json['dateOfBirth'].toDate() : null;
    _id = json['id'];
    _phone = json['phone'];
    _imgUrl = json['imgUrl'];
    _isOnline = json['isOnline'];
    _device = json['device'];
  }

  String? get fullName => _fullName;

  String? get email => _email;

  String? get password => _password;

  DateTime? get firstTime => _firstTime;

  DateTime? get lastAction => _lastAction;

  String? get id => _id;

  String? get phone => _phone;

  String? get imgUrl => _imgUrl;

  bool? get isOnline => _isOnline;

  DeviceInfoModel get device => _device!;

  DateTime? get dateOfBirth => _dateOfBirth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['password'] = _password;
    map['firstTime'] = _firstTime;
    map['lastAction'] = _lastAction;
    map['dateOfBirth'] = _dateOfBirth;
    map['id'] = _id;
    map['phone'] = _phone;
    map['imgUrl'] = _imgUrl;
    map['isOnline'] = _isOnline;
    map['device'] = _device;
    return map;
  }

  Map<String, dynamic> toStorage() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['password'] = _password;
    map['firstTime'] = _firstTime.toString();
    map['lastAction'] = _lastAction.toString();
    map['dateOfBirth'] = _dateOfBirth.toString();
    map['id'] = _id;
    map['phone'] = _phone;
    map['imgUrl'] = _imgUrl;
    map['isOnline'] = _isOnline;
    map['device'] = _device;
    return map;
  }
}
