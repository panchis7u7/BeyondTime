import 'package:beyond_time/models/schedule_activity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Single card widget object.
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key, required this.activity, required this.onTap})
      : super(key: key);

  final ScheduleActivity activity;
  final Function onTap;

  // Build UI.
  //######################################################################
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: "Schedule${activity.id}",
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onTap(context, this),
                      child: Container(
                        width: double.infinity - 40,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: activity.useGradient ? null : activity.topColor,
                            gradient: activity.useGradient && activity.bottomColor != null ? 
                            LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: const [0, 6],
                                colors: [activity.topColor, activity.bottomColor!]) : null,
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).shadowColor,
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 5)),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                activity.topTitle,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    activity.mainTitle,
                                    style: const TextStyle(
                                        letterSpacing: 2,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      const SizedBox(width: 2),
                                      Text(
                                        DateFormat('dd-MM-yyyy')
                                            .format(activity.begin),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      const SizedBox(width: 10),
                                      Text.rich(TextSpan(children: <InlineSpan>[
                                        TextSpan(
                                            text: DateFormat('dd-MM-yyyy')
                                                .format(activity.end),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white))
                                      ])),
                                      const SizedBox(width: 2)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
  //######################################################################
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  /* @override
  Widget build(BuildContext context) => StreamBuilder<GyroscopeEvent>(
        stream: SensorsPlatform.instance.gyroscopeEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            posX += (snapshot.data!.x * 0.1);
            posY += (snapshot.data!.y * 0.1);
          }
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      //..rotateX(posX / 1)
                      ..rotateY(posY / 100),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity - 40,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [
                                    posY,
                                    posY / posY
                                  ],
                                  colors: const [
                                    Colors.purple,
                                    Colors.orangeAccent
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  offset: Offset(posY, posX)
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Test",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: <Widget>[
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "CATs Training",
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 57, top: 0.5),
                                      child: Text("1234",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const <Widget>[
                                        SizedBox(width: 2),
                                        Text(
                                          "02/21",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        SizedBox(width: 30),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: "Expires Date ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white)),
                                          TextSpan(
                                              text: "07/24",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white))
                                        ])),
                                        SizedBox(width: 2)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ); */