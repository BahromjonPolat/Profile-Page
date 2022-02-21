import 'dart:convert';

/// title : "github"
/// url : "https://github.com/BahromjonPolat"

SocialMedia socialMediaFromJson(String str) =>
    SocialMedia.fromJson(json.decode(str));

String socialMediaToJson(SocialMedia data) => json.encode(data.toJson());

class SocialMedia {
  String? _title;
  String? _url;

  String get title => _title!;

  String get url => _url!;

  SocialMedia({
    String? title,
    String? url,
  }) {
    _title = title;
    _url = url;
  }

  SocialMedia.fromJson(dynamic json) {
    _title = json['title'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['url'] = _url;
    return map;
  }
}
