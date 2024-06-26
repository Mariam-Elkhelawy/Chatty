import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/components/reusable_components.dart';
import 'package:chatty/features/auth_screen.dart';
import 'package:chatty/features/chat/chat_screen.dart';
import 'package:chatty/features/home/home_screen.dart';
import 'package:chatty/features/login/login_screen.dart';
import 'package:chatty/features/room/add_room_screen.dart';
import 'package:chatty/features/settings/settings_screen.dart';
import 'package:chatty/features/signup/signup_screen.dart';
import 'package:chatty/features/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case AppRoutesName.auth:
        return MaterialPageRoute(
            builder: (context) => const AuthScreen(), settings: settings);
      case AppRoutesName.login:
        return MaterialPageRoute(
            builder: (context) => const LogInScreen(), settings: settings);
      case AppRoutesName.signup:
        return MaterialPageRoute(
            builder: (context) => const SignUpScreen(), settings: settings);
      case AppRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: settings);
      case AppRoutesName.addRoom:
        return MaterialPageRoute(
            builder: (context) => const AddRoomScreen(), settings: settings);
      case AppRoutesName.chat:
        return MaterialPageRoute(
            builder: (context) => const ChatScreen(), settings: settings);
      case AppRoutesName.settings:
        return MaterialPageRoute(
            builder: (context) => const SettingsScreen(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (context) => unDefinedRoute(), settings: settings);
    }
  }
}
