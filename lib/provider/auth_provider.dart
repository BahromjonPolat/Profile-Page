import 'package:profile/core/components/exporting_packages.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/data/device_info_model.dart';
import 'package:profile/services/fire_store_service.dart';

class AuthProvider extends ChangeNotifier {
  final GetStorage _storage = GetStorage();
  final AuthService _authService = AuthServiceMethods();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLogin = true;
  bool _isLoading = false;

  void changePage() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void showLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      DeviceInfoModel device = DeviceInfoModel();
      // Button bosilganida shu funksiya ishga tushadi
      String fullName = _nameController.text.trim();
      String email = _emailController.text.trim().toLowerCase();
      String password = _passwordController.text.trim();

      showLoading(true);

      if (!_isLogin) {
        _authService
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

            await FireStoreService().setUserData(user).then((value) async {
              showLoading(false);
              await _storage.write('user', user.toStorage());
              Fluttertoast.showToast(msg: 'Welcome ${user.fullName}!');
              CustomNavigator().pushAndRemoveUntil(const MyHomePage());
            });
          });
        });
      } else {

        // Login
        _authService.login(email: email, password: password).then((value) {
          Fluttertoast.showToast(msg: value);
          if (value == 'Welcome') {
            showLoading(false);
            Fluttertoast.showToast(msg: 'Welcome');
            CustomNavigator().pushAndRemoveUntil(const MyHomePage());
          } else {
            showLoading(false);
            Fluttertoast.showToast(msg: value);
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

  bool get isLoading => _isLoading;
}
