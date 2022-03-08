import 'package:profile/models/social_media_model.dart';

class ProfileModel {
  String? _sId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _type;
  DateTime? _dateOfBirth;
  DateTime? _started;
  DateTime? _lastAction;
  int? _experience;
  String? _bio;
  int? _projectsDone;
  int? _successRate;
  int? _teams;
  int? _clientReports;
  String? _imageUrl;
  String? _phone;
  String? _webSite;
  List<SocialMedia>? _socialMedias;

  List<SocialMedia> get socialMedias => _socialMedias!;

  String get sId => _sId!;

  String get firstName => _firstName!;

  String get lastName => _lastName!;

  String get email => _email!;

  String get type => _type!;

  DateTime get dateOfBirth => _dateOfBirth!;

  DateTime get started => _started!;

  int get experience => _experience!;

  String get bio => _bio!;

  int get projectsDone => _projectsDone!;

  int get successRate => _successRate!;

  int get teams => _teams!;

  int get clientReports => _clientReports!;

  String get imageUrl => _imageUrl!;

  String get webSite => _webSite!;

  String get phone => _phone!;

  DateTime get lastAction => _lastAction!;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    _sId = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _type = json['type'];
    _dateOfBirth = json['dateOfBirth'].toDate();
    _started = json['started'].toDate();
    _experience = json['experience'];
    _bio = json['bio'];
    _projectsDone = json['projectsDone'];
    _successRate = json['successRate'];
    _teams = json['teams'];
    _clientReports = json['clientReports'];
    _imageUrl = json['imageUrl'];
    _phone = json['phone'];
    _webSite = json['webSite'];
    _lastAction = json['lastAction'].toDate();
    _socialMedias = (json['socialMedias'] as List)
        .map((e) => SocialMedia.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _sId;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['email'] = _email;
    data['type'] = _type;
    data['dateOfBirth'] = _dateOfBirth;
    data['started'] = _started;
    data['experience'] = _experience;
    data['bio'] = _bio;
    data['projectsDone'] = _projectsDone;
    data['successRate'] = _successRate;
    data['teams'] = _teams;
    data['clientReports'] = _clientReports;
    data['imageUrl'] = _imageUrl;
    data['phone'] = _phone;
    data['webSite'] = _webSite;
    data['lastAction'] = _lastAction;
    return data;
  }
  Map<String, dynamic> toStorage() {
    final Map<String, dynamic> data = {};
    data['id'] = _sId;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['email'] = _email;
    data['type'] = _type;
    // data['dateOfBirth'] = _dateOfBirth;
    // data['started'] = _started;
    data['experience'] = _experience;
    data['bio'] = _bio;
    data['projectsDone'] = _projectsDone;
    data['successRate'] = _successRate;
    data['teams'] = _teams;
    data['clientReports'] = _clientReports;
    data['imageUrl'] = _imageUrl;
    data['phone'] = _phone;
    data['webSite'] = _webSite;
    // data['lastAction'] = _lastAction;
    return data;
  }
}
