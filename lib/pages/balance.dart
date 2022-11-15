import 'package:beyond_time/widgets/horizontal_cards.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<StatefulWidget> createState() => BalancePageState();
}

class BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Balance"),
    ),
    body: Column(
      children: const <Widget> [
        Expanded(
          flex: 2,
          child: HorizontalCards(data: ["2019", "2020", "2021"])
        ),
        Expanded(
          flex: 1,
          child: HorizontalCards(data: ["January", "February", "March"])
        ),
        Expanded(
          flex: 5,
          child: Placeholder(),
        )
      ],
    ),
  );
}
