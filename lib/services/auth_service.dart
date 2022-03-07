import 'package:profile/core/components/exporting_packages.dart';
import 'package:profile/services/fire_store_service.dart';
import 'dart:developer' as developer;

abstract class AuthService {
  Future register({required String email, required String password});

  Future<String> login({required String email, required String password});

  Future getCurrentUser();
}

class AuthServiceMethods extends AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreService _storeService = FireStoreService();
  final GetStorage _storage = GetStorage();
  late String _uid;

  @override
  Future getCurrentUser() async {
    String uid = _auth.currentUser!.uid;
    Map<String, dynamic> userData = await _storage.read('user');
    return UserModel.fromJson(userData);
  }

  @override
  Future<String> login(
      {required String email, required String password}) async {
    String message = 'Nothing';
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() async {
        _uid = _auth.currentUser!.uid;

        // Update user data
        await _storeService.updateUserData(_uid, data: {
          'lastAction': DateTime.now(),
          'isOnline': true,
        });

        message = 'Welcome';

        UserModel userModel = await _storeService.getUserById(_uid);
        await _storage.write('user', userModel.toJson());
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          message = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          message = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          message = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          message = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          message = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          message = "Signing in with Email and Password is not enabled.";
          break;
        default:
          message = "An undefined Error happened.";
      }
    } catch (e) {
      message = e.toString();
      print('AuthServiceMethods.login: $e');
    }

    return message;
  }

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
