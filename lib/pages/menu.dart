import 'package:beyond_time/router/routes.dart';
import 'package:beyond_time/themes/theme.dart';
import 'package:flutter/material.dart';

// Layout for menu drawer.
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Menu extends StatelessWidget {
  const Menu({super.key});

  // Build UI.
  //######################################################################
  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[DrawerHeader(child: Text("Menu"))] +
            Routes.menuOptions
                .map((option) => ListTile(
                      title: Text(option.name),
                      leading: Icon(option.icon, color: BeyondTheme.primary),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.pushNamed(context, option.route),
                    ))
                .toList(),
      );
  //######################################################################
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%