import 'package:flutter/material.dart';

class DateRange extends StatelessWidget {
  const DateRange({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: <Widget> [
      DropdownButton<String>(
        hint: const Text("Select date."),
        items: [
          "January",
          "February",
          "March",
          "April",
          "June",
          "July",
          "August",
          "September",
          "October",
          "November",
          "December"
        ].map((e) => DropdownMenuItem(
          value: e, 
          child: Text(e, style: const TextStyle(fontSize: 24))
          )
        ).toList(), 
      onChanged: (String? value) => {})
    ],
  );
}

// Row(
//                           children: [
//                             DropdownButton<String>(
//                                 hint: const Text("Select date."),
//                                 items: [
//                                   "January",
//                                   "February",
//                                   "March",
//                                   "April",
//                                   "June",
//                                   "July",
//                                   "August",
//                                   "September",
//                                   "October",
//                                   "November",
//                                   "December"
//                                 ]
//                                     .map((e) => DropdownMenuItem(
//                                         value: e,
//                                         child: Text(e,
//                                             style:
//                                                 const TextStyle(fontSize: 24))))
//                                     .toList(),
//                                 onChanged: (String? value) {
//                                   setState(() {
//                                     dropdownValue = value!;
//                                   });
//                                 }),
//                             DropdownButton<String>(
//                               onChanged: (String? value) {
//                                 setState(() {});
//                               },
//                               items: ["2021", "2022"]
//                                   .map((String value) => DropdownMenuItem(
//                                         value: value,
//                                         child: Text(value),
//                                       ))
//                                   .toList(),
//                             )
//                           ],
//                         )