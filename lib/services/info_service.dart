import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/provider/refresh_provider.dart';

class InfoService {
  final GetStorage _storage = GetStorage();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<ProfileModel> getDataFromUrl() async {
    try {
      DocumentSnapshot snap =
          await _fireStore.collection('admin').doc(NetworkLinks.uid).get();
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      ProfileModel profile = ProfileModel.fromJson(data);
      await _storage.write('profileData', profile.toJson());
      StaticData.staticProfile = profile;
      return profile;
    } catch (err) {
      return StaticData.staticProfile;
    }
  }

  Future<ProfileModel> getDataFromStorage() async {
    try {
      RefreshProvider provider = RefreshProvider();
      Map<String, dynamic> profileData =
          _storage.read('profileData') ?? StaticData.staticProfile.toJson();
      ProfileModel profileModel = ProfileModel.fromJson(profileData);

      return profileModel;
    } catch (err) {
      return StaticData.staticProfile;
    }
  }
}
