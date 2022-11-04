import 'package:flutter/material.dart';

// Layout for the about page.
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  // Build UI.
  //######################################################################
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
      );
  //######################################################################
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
