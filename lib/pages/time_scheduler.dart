import 'package:beyond_time/Database/db.dart';
import 'package:beyond_time/models/schedule_activity.dart';
import 'package:beyond_time/pages/menu.dart';
import 'package:beyond_time/pages/schedule_detail.dart';
import 'package:beyond_time/widgets/activity_card.dart';
import 'package:flutter/material.dart';


//----------------------------------------------------------------------
// Full day schedule. TODO: Specify day schedule.
class TimeScheduler extends StatefulWidget {
  const TimeScheduler({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimeSchedulerState();
}

class TimeSchedulerState extends State<TimeScheduler> {
  late List<ScheduleActivity> scheduledActivities;

  @override
  void initState() {
    //DB.deleteDatabase("schedules_activities.db");
    DB.insertActivity(ScheduleActivity(
        topTitle: "Lectura",
        mainTitle: "El Principito",
        topColor: Colors.purple,
        bottomColor: Colors.orangeAccent,
        useGradient: true,
        useFoil: false,
        begin: DateTime(2013, 3, 14, 11, 15),
        end: DateTime(2014, 29, 1, 17, 11)));
    DB.insertActivity(ScheduleActivity(
        topTitle: "Videojuegos",
        mainTitle: "Ghost Recon Wildlands",
        topColor: Colors.blueGrey,
        bottomColor: Colors.green,
        useGradient: true,
        useFoil: false,
        begin: DateTime(2017, 9, 7, 17, 30),
        end: DateTime(2018, 9, 7, 17, 30)));
    scheduledActivities = List.empty();
    loadSchedule();
    super.initState();
  }

  loadSchedule() async {
    List<ScheduleActivity> schedule = await DB.getSchedule();
    setState(() => scheduledActivities = schedule);
  }

  //----------------------------------------------------------------------
// Utility functions.
  void pushRoute(BuildContext context, ActivityCard card) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScheduleDetail(key: card.key, card: card),
        )).then((_) => loadSchedule());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const Drawer(child: Menu()),
        appBar: AppBar(
          title: const Text("Schedule"),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child: Column(
              children: scheduledActivities
                  .map((activity) =>
                      ActivityCard(activity: activity, onTap: pushRoute))
                  .toList()),
        ),
      );
}
