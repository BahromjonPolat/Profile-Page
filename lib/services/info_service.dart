import 'dart:convert';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/provider/refresh_provider.dart';

class InfoService {
  late SharedPreferences _pref;

  Future<ProfileModel> getDataFromUrl() async {
    try {
      _pref = await SharedPreferences.getInstance();
      Uri url = Uri.parse(NetworkLinks.profileInfoLink);
      var data = await get(url);

      await _pref.setString('profile', data.body.toString());
      ProfileModel profile = ProfileModel.fromJson(jsonDecode(data.body));

      StaticData.staticProfile = profile;

      return StaticData.staticProfile;

    } catch (err) {}
    return StaticData.staticProfile;
  }

  Future<ProfileModel> getDataFromPref() async {
    try {
      RefreshProvider provider = RefreshProvider();
      _pref = await SharedPreferences.getInstance();
      String profileData = _pref.getString('profile') ?? 'null';
      Map<String, dynamic> profileMap;

      if (profileData != 'null') {
        profileMap = jsonDecode(profileData);
      } else {
        profileMap = StaticData.profileData;
      }
      StaticData.staticProfile = ProfileModel.fromJson(profileMap);
      print(profileMap);
      provider.refresh();
      return StaticData.staticProfile;
    } catch (err) {}
    return StaticData.staticProfile;
  }
}
