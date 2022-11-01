import 'package:beyond_time/Pages/Time_Scheduler.dart';
import 'package:beyond_time/models/menu_option.dart';
import 'package:flutter/material.dart';

class Routes {
  static const root = "Home";

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: "Home",
        icon: Icons.home,
        name: "Home",
        screen: TimeScheduler())
  ];

  static onGenerateRoute(RouteSettings settings, Widget defaultWidget) =>
      MaterialPageRoute(builder: ((context) => defaultWidget));

  static Map<String, Widget Function(BuildContext)> getAppRoutes() =>
      Map.fromEntries(menuOptions.map((option) =>
          MapEntry(option.route, (BuildContext ctx) => option.screen)));
}
