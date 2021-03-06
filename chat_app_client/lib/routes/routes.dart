import 'package:flutter/material.dart';
import 'package:chat_app_client/pages/chat_page.dart';
import 'package:chat_app_client/pages/loading_page.dart';
import 'package:chat_app_client/pages/login_page.dart';
import 'package:chat_app_client/pages/register_page.dart';
import 'package:chat_app_client/pages/users_page.dart';

final Map<String, Widget Function(BuildContext context)> appRoutes = {
  RoutePath.usersRoute: (_) => UsersPage(),
  RoutePath.chatRoute: (_) => ChatPage(),
  RoutePath.loginRoute: (_) => LoginPage(),
  RoutePath.registerRoute: (_) => RegisterPage(),
  RoutePath.loadingRoute: (_) => LoadingPage(),
};

class RoutePath {
  static const loginRoute = 'login';
  static const registerRoute = 'register';
  static const usersRoute = 'users';
  static const chatRoute = 'chat';
  static const loadingRoute = 'loading';
}
