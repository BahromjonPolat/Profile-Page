import 'package:profile/core/components/exporting_packages.dart';

class IconWithKey {
  static String icon(String key) => _icons[key]!;

  static const Map<String, String> _icons = {
    "telegram": AssetIcon.telegram,
    "instagram": AssetIcon.instagram,
    "facebook": AssetIcon.facebook,
    "linkedIn": AssetIcon.linkedIn,
    "github": AssetIcon.gitHub,
  };
}
