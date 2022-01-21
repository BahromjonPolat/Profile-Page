import 'dart:convert';
import 'package:profile/core/components/exporting_packages.dart';

class InfoService {
  late SharedPreferences _pref;

  Future getDataFromUrl() async {
    try {
      _pref = await SharedPreferences.getInstance();
      Uri url = Uri.parse(NetworkLinks.profileInfoLink);
      var data = await get(url);

      await _pref.setString('profile', data.body.toString());
      ProfileModel profile = ProfileModel.fromJson(jsonDecode(data.body));

      StaticData.staticProfile = profile;
      print(StaticData.staticProfile);
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
      StaticData.staticProfile = ProfileModel.fromJson(profileMap);
    } catch (err) {}
  }
}
