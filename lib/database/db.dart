import 'package:beyond_time/models/schedule_activity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(
        join(await getDatabasesPath(), 'schedules_activities.db'),
        onCreate: (db, version) => db.execute("""
        CREATE TABLE Activities (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
          topTitle TEXT NOT NULL,
          mainTitle TEXT NOT NULL, 
          topColor TEXT NOT NULL,
          bottomColor TEXT,
          useGradient BOOLEAN NOT NULL CHECK (useGradient IN (0, 1)),
          useFoil BOOLEAN NOT NULL CHECK (useFoil IN (0, 1)),
          begin TEXT NOT NULL,
          end TEXT NOT NULL
          );
        """),
        version: 1);
  }

  static Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  static Future<int> insertActivity(ScheduleActivity activity) async =>
      (await _openDB()).insert("Activities", activity.toMap());

  static Future<List<ScheduleActivity>> getSchedule() async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> activitiesMap =
        await db.query("Activities");

    return List.generate(
        activitiesMap.length, (i) => ScheduleActivity(
            id: activitiesMap[i]['id'],
            topTitle: activitiesMap[i]['topTitle'],
            mainTitle: activitiesMap[i]['mainTitle'],
            topColor: Color(int.parse(
              activitiesMap[i]['topColor'].split('(0x')[1].split(')')[0], 
              radix: 16)
            ),
            bottomColor: Color(int.parse(
              activitiesMap[i]['bottomColor'].split('(0x')[1].split(')')[0],
              radix: 16)
            ),
            useGradient: activitiesMap[i]['useGradient'] == 1 ? true : false,
            useFoil: activitiesMap[i]['useFoil'] == 1 ? true : false,
            begin: DateFormat('dd-MM-yyyy HH:mm').parse(activitiesMap[i]['begin']),
            end: DateFormat('dd-MM-yyyy HH:mm').parse(activitiesMap[i]['end'])));
  }
}
