import 'package:flutter/material.dart';
import 'package:mine_platform_app/pages/index_page/index_page.dart';
import 'package:mine_platform_app/pages/login_page/login_page.dart';
import 'package:mine_platform_app/pages/index_page/child_pages/mine_page/mine_setting_page.dart';
import 'package:mine_platform_app/pages/index_page/child_pages/mine_page/mine_resetPassword_page.dart';

final String splashPath = 'splash';
final String indexPage = "/";
final String loginPage = '/login';
final String mineSettingPage = '/mineSettingPage';
final String mineResetPasswordPage = '/mineResetPasswordPage';
final String notFoundPath = '404';
var router = {
  loginPage: (context) => const LoginPage(),
  indexPage: (context) => const IndexPage(),
  mineSettingPage: (context) => const MineSettingPage(),
  mineResetPasswordPage: (context) => const MineResetPasswordPage(),
};
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;

  final Function pageContentBuilder = router[name] as Function;
  print(pageContentBuilder.toString());
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
