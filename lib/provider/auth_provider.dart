import 'package:profile/core/components/exporting_packages.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/data/device_info_model.dart';
import 'package:profile/services/fire_store_service.dart';

class AuthProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLogin = true;

  void changePage() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void onPressed() {
    GetStorage storage = GetStorage();
    AuthService authService = AuthServiceMethods();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      DeviceInfoModel device = DeviceInfoModel();
      // Button bosilganida shu funksiya ishga tushadi
      String fullName = _nameController.text.trim();
      String email = _emailController.text.trim().toLowerCase();
      String password = _passwordController.text.trim();

      if (!_isLogin) {
        authService
            .register(email: email, password: password)
            .whenComplete(() async {
          // set device info
          String uid = FirebaseAuth.instance.currentUser!.uid;
          Map<String, dynamic> deviceInfo = await device.readAndroidBuildData();
          FirebaseFirestore.instance
              .collection('device_info')
              .doc(uid)
              .set(deviceInfo)
              .whenComplete(() async {
            // Set User data
            String uid = FirebaseAuth.instance.currentUser!.uid;
            UserModel user = UserModel(
              id: uid,
              fullName: fullName,
              email: email,
              password: password,
              isOnline: false,
              phone: 'null',
              imgUrl: 'default',
              firstTime: DateTime.now(),
              lastAction: DateTime.now(),
              device: device.toReference(uid),
            );
            await storage.write('user', user.toJson());
            await FireStoreService().setUserData(user).then((value) {
              Fluttertoast.showToast(msg: 'Welcome ${user.fullName}!');
            });
          });
        });
      } else {
        authService.login(email: email, password: password).then((value) {
          Fluttertoast.showToast(msg: value);
          if (value == 'Welcome!') {
            CustomNavigator().pushReplacement(const MyHomePage());
          }
        });
      }
    }
  }

  TextEditingController get nameController => _nameController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get emailController => _emailController;

  GlobalKey<FormState> get formKey => _formKey;

  bool get isLogin => _isLogin;
}
