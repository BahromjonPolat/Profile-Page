class ProfileInfo {
  late String _sId;
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _type;
  late int _experience;
  late String _bio;
  late int _projectsDone;
  late int _successRate;
  late int _teams;
  late int _clientReports;
  late DateTime _dateOfBirth;
  late DateTime _started;
  late String _imageUrl;

  DateTime get dateOfBirth => _dateOfBirth;

  String get sId => _sId;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get type => _type;

  int get experience => _experience;

  String get bio => _bio;

  int get projectsDone => _projectsDone;

  int get successRate => _successRate;

  int get teams => _teams;

  DateTime get started => _started;

  String get imageUrl => _imageUrl;

  int get clientReports => _clientReports;

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _type = json['type'];
    _experience = json['experience'];
    _bio = json['bio'];
    _projectsDone = json['projectsDone'];
    _successRate = json['successRate'];
    _teams = json['teams'];
    _dateOfBirth = DateTime.parse(json['dateOfBirth']);
    _started = DateTime.parse(json['started']);
    _imageUrl = json['imageUrl'];
    _clientReports = json['clientReports'];
  }

  Map<String, dynamic> toJson() => {
        '_id': _sId,
        'firstName': _firstName,
        'lastName': _lastName,
        'email': _email,
        'type': _type,
        'experience': _experience,
        'bio': _bio,
        'projectsDone': _projectsDone,
        'successRate': _successRate,
        'teams': _teams,
        'started': _started,
        'dateOfBirth': _dateOfBirth,
        'imageUrl': _imageUrl,
        'clientReports': _clientReports,
      };
}
