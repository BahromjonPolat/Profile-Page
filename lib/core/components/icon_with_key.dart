import 'package:profile/core/components/exporting_packages.dart';

class IconWithKey {
  static String icon(String key) => _icons[key]!;

  static const Map<String, String> _icons = {
    "telegram": AppIcon.telegram,
    "instagram": AppIcon.instagram,
    "facebook": AppIcon.facebook,
    "linkedIn": AppIcon.linkedIn,
    "github": AppIcon.gitHub,
  };
}
