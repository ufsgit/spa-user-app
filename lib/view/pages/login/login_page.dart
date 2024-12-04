import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/login/login_provider.dart';
import 'package:spa_app_user/view/widgets/login/custom_button_widget.dart';
import 'package:spa_app_user/view/widgets/login/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/auth_bg.png'),
              ),
            ),
            child: ListView(
            
              padding: EdgeInsets.only(top: 65,left: 16,right: 16),
              physics: ClampingScrollPhysics(),
              children: [
                Image.asset('assets/images/spa_logo.png',
                height: 74,
                width: 76,
                ),
                Align(
                  child: Text(
                    'Spa App',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 24,
                        color: AppColors.textWhite, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 49),
                Align(
                  child: Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textWhite, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 4),
                Align(
                  child: Text(
                    'Log in to your account.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textWhite, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 48),
                CustomTextFieldWidget(
                  height: 54,
                  controller: loginProvider.userNameController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                CustomTextFieldWidget(
                  height: 54,
                  controller: loginProvider.passwordController,
                  hintText: 'Password',
                  obscureText: loginProvider.isObscure,
                  suffixIcon: IconButton(
                    onPressed: loginProvider.toggleVisibility,
                    icon: Icon(
                      loginProvider.isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textGrey600,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                CustomButtonWidget(
                  height: 48,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textWhite, fontWeight: FontWeight.w700),
                  width: MediaQuery.sizeOf(context).width,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  color: AppColors.buttonColor,
                  text: 'Log In',
                  onPressed: () {
                    if (loginProvider.userNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Please enter your email'),
                        backgroundColor: AppColors.appThemeOrange,
                      ));
                      return;
                    }

                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(loginProvider.userNameController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            const Text('Please enter a valid email address'),
                        backgroundColor: AppColors.appThemeOrange,
                      ));
                      return;
                    }

                    if (loginProvider.passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Please enter your password'),
                        backgroundColor: AppColors.appThemeOrange,
                      ));
                      return;
                    }

                    // If all validations pass, proceed with login
                    loginProvider.login(
                        email: loginProvider.userNameController.text,
                        passWord: loginProvider.passwordController.text,
                        context: context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
