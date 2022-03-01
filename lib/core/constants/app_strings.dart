class AppStrings {
  static const String locale = 'en';
  static final String bio = _getString('bio');
  static final String email = _getString('email');
  static final String about = _getString('about');
  static final String onTheWeb = _getString('onTheWeb');
  static final String website = _getString('website');
  static final String phone = _getString('phone');
  static final String work = _getString('work');
  static final String dateOfBirth = _getString('dateOfBirth');
  static final String address = _getString('address');
  static final String type = _getString('type');
  static final String started = _getString('started');
  static final String experience = _getString('experience');
  static final String teams = _getString('teams');
  static final String year = _getString('year');
  static final String projectsDone = _getString('projectsDone');
  static final String clientReports = _getString('clientReports');
  static final String middleEmployee = _getString('middleEmployee');
  static final String flutterDeveloper = _getString('flutterDeveloper');
  static final String successRate = _getString('successRate');
  static final String message = _getString('message');
  static final String online = _getString('online');
  static final String fullName = _getString('fullName');
  static final String signIn = _getString('signIn');
  static final String signUp = _getString('signUp');
  static final String password = _getString('password');


  static final Map<String, Map<String, String>> map = {
    "bio": _setString('Bio', 'BIO'),
    "email": _setString('Email', 'Email'),
    "about": _setString('Haqida', 'About'),
    "onTheWeb": _setString('Vebda', 'ON THE WEB'),
    "website": _setString('VEB SAYT', 'WEBSITE'),
    "phone": _setString('Telefon', 'Phone'),
    "work": _setString('Ishlar', 'Work'),
    "dateOfBirth": _setString('Tug\'ilgan kun', 'Date Of Birth'),
    "address": _setString('Manzil', 'Address'),
    "type": _setString('Turi', 'Type'),
    "started": _setString('Boshlagan', 'Started'),
    "experience": _setString('Tajriba', 'Experience'),
    "projectsDone": _setString('Bitirgan Loyihalar', 'Projects Done'),
    "year": _setString('Yil', 'Year'),
    "successRate": _setString('Muvaffaqiyat darajasi', 'Success Rate'),
    "clientReports": _setString('Mijoz hisobotlari', 'Client Reports'),
    "teams": _setString('Jamoalar', 'Teams'),
    "middleEmployee": _setString('O\'rta daraja', 'Middle Employee'),
    "flutterDeveloper" : _setString("Flutter Dasturchi", "Flutter Developer"),
    "message" : _setString('Xabar', 'Message'),
    "online" : _setString('Onlayn', 'Online'),
    "signUp" : _setString('Ro`yxatdan o`tish', 'Sign Up'),
    "signIn" : _setString("Kirish", 'Sign In'),
    "password" : _setString('Parol', 'Password'),
    "fullName" : _setString('Ism, sharif', 'Full Name'),
  };

  static Map<String, String> _setString(String uz, String en) => {
        "uz": uz,
        "en": en,
      };

  static String _getString(String key) => map[key]![locale].toString();
}
