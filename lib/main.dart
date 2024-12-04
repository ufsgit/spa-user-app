import 'dart:io';

import 'package:spa_app_user/constants/theme/app_colors.dart';
import 'package:spa_app_user/controller/dashboard/admin_dashboard_provider.dart';
import 'package:spa_app_user/controller/dashboard/customer_provider.dart';
import 'package:spa_app_user/controller/dashboard/filter_options_provider.dart';
import 'package:spa_app_user/controller/login/login_provider.dart';
import 'package:spa_app_user/view/pages/admin/bottom_navigation_screen.dart';
import 'package:spa_app_user/view/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => DashboardProvider()),
    ChangeNotifierProvider(create: (_) => CustomerProvider()),
    ChangeNotifierProvider(create: (_) => FilterProvider()),
  ], child: const MyApp()));
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  AuthWrapperState createState() => AuthWrapperState();
}

class AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

      Provider.of<LoginProvider>(context, listen: false).checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, authProvider, child) {
              // authProvider.logout(context);

        if (authProvider.isLoading) {

          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return MaterialApp(
          title: 'Spa',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackground,
              textTheme: TextTheme(
                bodyMedium: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                bodyLarge: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                bodySmall: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )),
          home: authProvider.isLoggedIn
              ? const BottomNavigationScreen()
              : const LoginPage(),
          // home: BottomNavigationScreen(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthWrapper();
  }
}
