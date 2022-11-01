import 'package:beyond_time/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class TimeScheduler extends StatelessWidget {
  TimeScheduler({Key? key}) : super(key: key);

  final List<Widget> cardWidgets = [const ActivityCard(), const ActivityCard()];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Schedule", 
      style: TextStyle(color: Colors.black87)
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ],
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white 
      ),
    ),
    body: Column(
      children: [
        const Expanded(
          flex: 3,
          child: Placeholder()
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          )
        )
      ],
    ),
  );
}

//250