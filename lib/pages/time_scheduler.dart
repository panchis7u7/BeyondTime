import 'package:beyond_time/pages/schedule_detail.dart';
import 'package:beyond_time/widgets/activity_card.dart';
import 'package:flutter/material.dart';

void pushRoute(BuildContext context, ActivityCard card) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ScheduleDetail(key: card.key, card: card),
        ));
  }

class TimeScheduler extends StatelessWidget {
  const TimeScheduler({Key? key}) : super(key: key);

  final List<Widget> cardWidgets = const [
    ActivityCard(title: "Test1", onTap: pushRoute, id: "Schedule1"),
    ActivityCard(title: "Test2", onTap: pushRoute, id: "Schedule2"),
    ActivityCard(title: "Test3", onTap: pushRoute, id: "Schedule3"),
    ActivityCard(title: "Test4", onTap: pushRoute, id: "Schedule4")
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title:
          const Text("Schedule", style: TextStyle(
            color: Colors.black87,
            fontSize: 18
          )
        ),
      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: const TextStyle(color: Colors.white),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ],
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: cardWidgets,
      ),
    ),
  );
}

//250
//1827.25