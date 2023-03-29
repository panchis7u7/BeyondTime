import 'package:beyond_time/widgets/horizontal_cards.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<StatefulWidget> createState() => BalancePageState();
}

class BalancePageState extends State<BalancePage> {
  //TextEditingController dateInput = TextEditingController();
  String dropdownValue = "";

  @override
  void initState() {
    //dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Balance"),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
                onTap: () => {},
                child: Container(
                  width: double.infinity - 40,
                  height: 200,
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).shadowColor,
                            blurRadius: 15,
                            spreadRadius: 5,
                            offset: const Offset(0, 5)),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            Text("Balance: ",
                                style: TextStyle(
                                  fontSize: 26,
                                )),
                            Text("\$40,000.00 MXN",
                                style: TextStyle(fontSize: 26, color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
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
                                ]
                                    .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e,
                                            style:
                                                const TextStyle(fontSize: 24))))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                }),
                            DropdownButton<String>(
                              onChanged: (String? value) {
                                setState(() {});
                              },
                              items: ["2021", "2022"]
                                  .map((String value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      );
}
