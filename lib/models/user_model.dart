import 'dart:convert';

import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/data/device_info_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? _fullName;
  String? _email;
  String? _password;
  DateTime? _firstTime;
  DateTime? _lastAction;
  String? _id;
  String? _phone;
  String? _imgUrl;
  bool? _isOnline;
  DeviceInfoModel? _device;

  UserModel({
    String? fullName,
    String? email,
    String? password,
    DateTime? firstTime,
    DateTime? lastAction,
    String? id,
    String? phone,
    String? imgUrl,
    bool? isOnline,

  }) {
    _fullName = fullName;
    _email = email;
    _password = password;
    _firstTime = firstTime;
    _lastAction = lastAction;
    _id = id;
    _phone = phone;
    _imgUrl = imgUrl;
    _isOnline = isOnline;
  }

  UserModel.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _email = json['email'];
    _password = json['password'];
    _firstTime = json['firstTime'];
    _lastAction = json['lastAction'];
    _id = json['id'];
    _phone = json['phone'];
    _imgUrl = json['imgUrl'];
    _isOnline = json['isOnline'];
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['password'] = _password;
    map['firstTime'] = _firstTime;
    map['lastAction'] = _lastAction;
    map['id'] = _id;
    map['phone'] = _phone;
    map['imgUrl'] = _imgUrl;
    map['isOnline'] = _isOnline;
    return map;
  }
}
