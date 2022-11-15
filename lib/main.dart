import 'package:beyond_time/Pages/Time_Scheduler.dart';
import 'package:beyond_time/providers/meetings_provider.dart';
import 'package:beyond_time/router/routes.dart';
import 'package:beyond_time/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MeetingsProvider(), lazy: false)
    ],
    child: const BeyondTime(),
  );
}

class BeyondTime extends StatelessWidget {
  const BeyondTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Beyond Time",
        initialRoute: "Home",
        routes: Routes.getAppRoutes(),
        theme: BeyondTheme.lightTheme,
        onGenerateRoute: (settings) =>
            Routes.onGenerateRoute(settings, const TimeScheduler()),
      );
}
