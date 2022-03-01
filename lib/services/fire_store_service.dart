import 'package:flutter/rendering.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/data/device_info_model.dart';

class FireStoreService {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future setDevice(String uid) async {
    try {
      DeviceInfoModel device = DeviceInfoModel();
      Map<String, dynamic> deviceInfo = await device.readAndroidBuildData();
      return await _fireStore
          .collection('device_info')
          .doc(uid)
          .set(deviceInfo);
    } catch (e) {}
  }

  Future setUserData(UserModel user) async {
    _fireStore
        .collection('/users')
        .doc(user.id)
        .set(user.toJson())
        .whenComplete(() {});
  }

  //
  Future<UserModel> getUserById(String uid) async {
    try {
      DocumentSnapshot snap =
          await _fireStore.collection('users').doc(uid).get();
      UserModel user = UserModel.fromJson(snap.data());
      return user;
    } catch (e) {
      debugPrint(e.toString());
    }

    return UserModel();
  }

  Future<void> updateUserData(String uid,
      {required Map<String, dynamic> data}) async {
    return await _fireStore.collection('users').doc(uid).update(data);
  }
}
