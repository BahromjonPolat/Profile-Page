class ProfileInfo {
  String? _sId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _type;
  int? _experience;
  String? _bio;
  int? _projectsDone;
  int? _successRate;
  int? _teams;

  String? get sId => _sId;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get type => _type;

  int? get experience => _experience;

  String? get bio => _bio;

  int? get projectsDone => _projectsDone;

  int? get successRate => _successRate;

  int? get teams => _teams;

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
      };
}
