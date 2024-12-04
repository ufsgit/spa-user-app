import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/http/http_urls.dart';
import 'package:spa_app_user/http/loader.dart';
import 'package:spa_app_user/view/pages/admin/bottom_navigation_screen.dart';
import 'package:spa_app_user/view/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/http_requests.dart';

  Map<String, dynamic> userData = {};
class LoginProvider extends ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  bool get isObscure => _isObscure;
  bool _isLoading = true;
  bool _isLoggedIn = false;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');

    _isLoggedIn = token != null;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> setLoggedIn(bool value) async {
    _isLoggedIn = value;
    notifyListeners();
  }

  void changeTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void toggleVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  Future<void> login(
      {required String email,
      required String passWord,
      required BuildContext context}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Loader.showLoader(context);

    Map<String, dynamic> jsonData = {
      "email": email,
      "password": passWord,
    };

    print('login data $jsonData');

    try {
      var response = await HttpRequest.httpPostRequest(
        bodyData: jsonData,
        endPoint: HttpUrls.loginCheck,
      );

      if (response != null) {
        Loader.stopLoader(context);
        userData = response.data['data']['user'];
        print('UIGBI ${userData}');
        var userTypeId = response.data['data']['user']['userTypeId'].toString();

        await preferences.setString('token', response.data['data']['token']);
        await preferences.setString('spa_admin_id', userTypeId);
        if (userTypeId == '2') {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const BottomNavigationScreen()),
            (route) => false,
          );
          print("Successful, redirected to admin");
        } else if (userTypeId == '3') {
          print("Successful, redirected to DemoPage");
        } else {
          print("Not Successful");
        }
        userNameController.clear();
        passwordController.clear();
      } else {
        Loader.stopLoader(context);
        print("Not Successful");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Invalid Credentials'),
          backgroundColor: AppColors.textBlack,
        ));
      }
    } catch (e) {
      print('Failed to login: $e');
    }

    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
    await preferences.remove('spa_admin_id');

    Provider.of<LoginProvider>(context, listen: false).setLoggedIn(false);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }
}
