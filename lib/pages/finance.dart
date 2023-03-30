import 'package:beyond_time/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<StatefulWidget> createState() => BalancePageState();
}

class BalancePageState extends State<BalancePage> with RestorationMixin {
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2023, 7, 25));

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
          onComplete: _selectDate,
          onPresent: (NavigatorState navigator, Object? arguments) {
            return navigator.restorablePush(_datePickerRoute,
                arguments: _selectedDate.value.millisecondsSinceEpoch);
          });

  static Route<DateTime> _datePickerRoute(
      BuildContext context, Object? arguments) {
    return DialogRoute<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return DatePickerDialog(
            restorationId: 'date_picker_dialog',
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
            firstDate: DateTime(2021),
            lastDate: DateTime(2040),
          );
        });
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  @override
  void initState() {
    //dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("Balance")),
      body: Column(children: <Widget>[
        CustomCard(fab: true, children: [
          Row(
            children: const <Widget>[
              Text("Balance: ", style: TextStyle(fontSize: 26)),
              Text("\$40,000.00 MXN",
                  style: TextStyle(fontSize: 26, color: Colors.red)),
            ],
          ),
          const SizedBox(height: 20),
          const Text("To consult expenses from a range of time:"),
          const SizedBox(height: 10),
          ResponsiveGridRow(rowSegments: 24, children: [
            ResponsiveGridCol(
              lg: 24,
              md: 12,
              xs: 12,
              child: ElevatedButton(
                  onPressed: () {
                    _restorableDatePickerRouteFuture.present();
                  },
                  child: const Text("Begin Range")),
            ),
            ResponsiveGridCol(
              lg: 0,
              md: 0,
              xs: 0,
              child: const SizedBox(width: 15),
            ),
            ResponsiveGridCol(
              lg: 24,
              md: 12,
              xs: 12,
              child: ElevatedButton(
                  onPressed: () {
                    _restorableDatePickerRouteFuture.present();
                  },
                  child: const Text("End Range")),
            )
          ])
        ]),
      ]));
}
