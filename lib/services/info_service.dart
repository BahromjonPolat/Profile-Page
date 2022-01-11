import 'package:profile/core/components/exporting_packages.dart';

class InfoService {
  Future getData() async {
    Uri url = Uri.parse(NetworkLinks.profileInfoLink);
    var data = await get(url);
    print(data.body);
  }
}
