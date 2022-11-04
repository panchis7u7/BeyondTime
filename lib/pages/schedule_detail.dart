import 'package:beyond_time/database/db.dart';
import 'package:beyond_time/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ScheduleDetail extends StatefulWidget {
  const ScheduleDetail({super.key, required this.card});

  final ActivityCard card;

  @override
  State<StatefulWidget> createState() => ScheduleDetailState();
}

class ScheduleDetailState extends State<ScheduleDetail> {
  late Color pickerColor;

  @override
  void initState() {
    pickerColor = widget.card.activity.topColor;
    super.initState();
  }

  void onColorChanged(Color color) => setState(() => pickerColor = color);

  Future<String?> _showDialog(
          {required BuildContext context,
          required Widget child,
          required Function() onSave}) async =>
      showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Choose a color"),
          content: child,
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: onSave,
                child: const Text('Save', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.card.activity.mainTitle),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Hero(
              tag: "Schedule${widget.card.activity.id}",
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: widget.card.activity.useGradient
                      ? null
                      : widget.card.activity.topColor,
                  decoration: BoxDecoration(
                    gradient: widget.card.activity.useGradient &&
                            widget.card.activity.bottomColor != null
                        ? LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [
                                0,
                                6
                              ],
                            colors: [
                                widget.card.activity.topColor,
                                widget.card.activity.bottomColor!
                              ])
                        : null,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.card.activity.mainTitle,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 28),
                        )
                      ]),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.card.activity.topColor,
                        ),
                        onPressed: () => _showDialog(
                            context: context,
                            onSave: () {
                              setState(() =>
                                  widget.card.activity.topColor = pickerColor);
                              //DB.updateSchedule(widget.card.activity);
                            },
                            child: ColorPicker(
                                pickerColor: pickerColor,
                                onColorChanged: onColorChanged)),
                        child: const Text("Top Color"),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.card.activity.bottomColor,
                        ),
                        onPressed: !widget.card.activity.useGradient
                            ? null
                            : () => _showDialog(
                                context: context,
                                onSave: () {
                                  setState(() => widget
                                      .card.activity.bottomColor = pickerColor);
                                  //DB.updateSchedule(widget.card.activity);
                                },
                                child: ColorPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: onColorChanged,
                                )),
                        child: const Text("Bottom Color"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
}
