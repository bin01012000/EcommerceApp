import 'package:flutter/widgets.dart';
import 'package:fruit_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:fruit_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:fruit_app/screens/login_success/login_success_screen.dart';
import 'package:fruit_app/screens/sign_in/sign_in_screen.dart';
import 'package:fruit_app/screens/sign_up/sign_up_screen.dart';
import 'package:fruit_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
};
