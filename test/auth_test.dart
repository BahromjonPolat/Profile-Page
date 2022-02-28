import 'package:flutter_test/flutter_test.dart';
import 'package:profile/core/components/exporting_packages.dart';

main()async {
  await Firebase.initializeApp();
  AuthService auth = AuthServiceMethods();
  test('Register', () async {
    String email = 'test.user@gmail.com';
    String password = 'Test.User123';
    // auth.register(email, password).then((value) => print(value));
  });
}
