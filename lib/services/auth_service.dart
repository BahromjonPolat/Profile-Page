import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/core/data/device_info_model.dart';

abstract class AuthService {
  Future register({required String email, required String password});

  Future login();

  Future getCurrentUser();
}

class AuthServiceMethods extends AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future getCurrentUser() async {}

  @override
  Future login() async {}

  @override
  Future register({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
