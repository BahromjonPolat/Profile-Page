import 'dart:convert';

import 'package:profile/core/components/exporting_packages.dart';

class InfoService {
  final GetStorage _storage = GetStorage();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<ProfileModel> getDataFromUrl() async {
    try {
      DocumentSnapshot snap =
          await _fireStore.collection('admin').doc(AdminData.id).get();
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      ProfileModel profile = ProfileModel.fromJson(data);
      // print('InfoService.getDataFromUrl: UP');
      // await _storage.write('profileData', jsonEncode(data));
      // print('InfoService.getDataFromUrl');
      StaticData.staticProfile = profile;
      return profile;
    } catch (err) {
      return StaticData.staticProfile;
    }
  }

  Future<ProfileModel> getDataFromStorage() async {
    try {
      Map<String, dynamic> profileData =
         jsonDecode(_storage.read('profileData')) ?? StaticData.staticProfile.toJson();
      ProfileModel profileModel = ProfileModel.fromJson(profileData);
      return profileModel;
    } catch (err) {
      return StaticData.staticProfile;
    }
  }
}
