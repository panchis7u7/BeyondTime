import 'package:beyond_time/Pages/Time_Scheduler.dart';
import 'package:beyond_time/router/routes.dart';
import 'package:beyond_time/themes/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BeyondTime());

class BeyondTime extends StatelessWidget {
  const BeyondTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: "Beyond Time",
    initialRoute: "Home",
    routes: Routes.getAppRoutes(),
    theme: BeyondTheme.darkTheme,
    onGenerateRoute: (settings) => Routes.onGenerateRoute(settings, const TimeScheduler()),
  );
}
