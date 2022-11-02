import 'package:beyond_time/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ScheduleDetail extends StatelessWidget {
  const ScheduleDetail({
    Key? key, 
    required this.card
  }) : super(key: key);

  final ActivityCard card;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(card.title, style: const TextStyle(color: Colors.black87)),
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),
    ),
    body: Column(
      children: <Widget>[
        Hero(
          tag: card.id,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 6],
                  colors: [Colors.purple, Colors.orangeAccent]
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Text(card.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28
                  ),)
                ]
              ),
            ),
          ),
        )
      ],
    ),
  );
}
