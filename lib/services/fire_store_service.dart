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
}
