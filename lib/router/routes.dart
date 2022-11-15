import 'package:beyond_time/Pages/Time_Scheduler.dart';
import 'package:beyond_time/models/menu_option.dart';
import 'package:beyond_time/pages/about.dart';
import 'package:beyond_time/pages/balance.dart';
import 'package:beyond_time/pages/settings.dart';
import 'package:flutter/material.dart';

// Application routes.
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Routes {
  static const root = "Home";

  // Static page routing definitions.
  //######################################################################
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: "Home",
        icon: Icons.home,
        name: "Home",
        screen: const TimeScheduler()),
    MenuOption(
      route: "Balance", 
      icon: Icons.balance, 
      name: "Balance", 
      screen: const BalancePage()),
    MenuOption(
        route: "Settings",
        icon: Icons.settings,
        name: "Settings",
        screen: const Settings()),
    MenuOption(
        route: "About",
        icon: Icons.info,
        name: "About",
        screen: const About())  
  ];
  //######################################################################

  // Utility functions.
  //######################################################################

  // ignore: todo
  // TODO: Definition.
  //----------------------------------------------------------------------
  static onGenerateRoute(RouteSettings settings, Widget defaultWidget) =>
      MaterialPageRoute(builder: ((context) => defaultWidget));

  // Parse the list of the option to a map for named navigation.
  //----------------------------------------------------------------------
  static Map<String, Widget Function(BuildContext)> getAppRoutes() =>
      Map.fromEntries(menuOptions.map((option) =>
          MapEntry(option.route, (BuildContext ctx) => option.screen)));
  //######################################################################
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%