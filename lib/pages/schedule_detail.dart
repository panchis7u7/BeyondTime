import 'package:beyond_time/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ScheduleDetail extends StatelessWidget {
  const ScheduleDetail({Key? key, required this.card}) : super(key: key);

  final ActivityCard card;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(card.activity.mainTitle,
              style: const TextStyle(color: Colors.black87)),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black87,
          ),
        ),
        body: Column(
          children: <Widget>[
            Hero(
              tag: "Schedule${card.activity.id}",
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: card.activity.useGradient ? null : card.activity.topColor,
                  decoration: BoxDecoration(
                    gradient: card.activity.useGradient && card.activity.bottomColor != null ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0, 6],
                        colors: [card.activity.topColor, card.activity.bottomColor!]) : null,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          card.activity.mainTitle,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 28),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      );
}
