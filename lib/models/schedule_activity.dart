import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleActivity {
  int? id;
  String topTitle;
  String mainTitle;
  Color topColor;
  Color? bottomColor;
  bool useGradient;
  bool useFoil;
  DateTime begin;
  DateTime end;

  ScheduleActivity({
    this.id,
    required this.topTitle,
    required this.mainTitle,
    required this.topColor,
    this.bottomColor,
    required this.useGradient,
    required this.useFoil,
    required this.begin,
    required this.end});

  Map<String, dynamic> toMap() => {
        'id': id,
        'topTitle': topTitle,
        'mainTitle': mainTitle,
        'topColor': topColor.toString(),
        'bottomColor': bottomColor?.toString(),
        'useGradient': useGradient ? 1 : 0,
        'useFoil': useFoil ? 1 : 0,
        'begin': DateFormat('dd-MM-yyyy HH:mm').format(begin),
        'end': DateFormat('dd-MM-yyyy HH:mm').format(end)
      };
}
