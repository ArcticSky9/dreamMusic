import 'package:dream_music/src/components/network/network_env_route.dart';
import 'package:dream_music/src/pages/login/login_page.dart';
import 'package:dream_music/src/pages/setting/setting_page.dart';
import 'package:dream_music/src/pages/songlist/songlist_page.dart';
import 'package:flutter/material.dart';
import 'custom_routes.dart';

class PageRouters {
  static const String networkEnv = "networkEnv";
  static const String login = "login";
  static const String setting = "setting";
  static const String songlist = "songlist";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;
    debugPrint("[route]open route -----> name=$name, args=$args");
    switch (name) {
      case login:
        return ModelRoute(settings: settings, child: const LoginPage());
      case setting:
        return ModelRoute(settings: settings, child: SettingPage());
      case networkEnv:
        return ModelRoute(settings: settings, child: const NetworkEnvPage());
      case songlist:
        {
          int id = 0;
          if (args is int) {
            id = args;
          }
          return NoneAnimateRoute(
              settings: settings, child: SonglistPage(id: id));
        }
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
