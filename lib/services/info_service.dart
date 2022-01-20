import 'dart:convert';

import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/models/profile_info_model.dart';

class InfoService {
  late SharedPreferences _pref;

  Future getDataFromUrl() async {
    try {
      _pref = await SharedPreferences.getInstance();
      Uri url = Uri.parse(NetworkLinks.profileInfoLink);
      var data = await get(url);
      print(data.body);
      await _pref.setString('profile', data.body.toString());
      // return ProfileInfo.fromJson(data.body as Map<String, dynamic>);
    } catch (err) {}
  }

  Future getDataFromPref() async {
    try {
      _pref = await SharedPreferences.getInstance();
      String profileData = _pref.getString('profile') ?? 'null';
      Map<String, dynamic> profileMap;

      if (profileData != 'null') {
        profileMap = jsonDecode(profileData);
      } else {
        profileMap = StaticData.profileData;
      }
      StaticData.staticProfile = ProfileInfo.fromJson(profileMap);
    } catch (err) {}
  }
}
