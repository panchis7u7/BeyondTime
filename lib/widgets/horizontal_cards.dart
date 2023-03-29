import 'package:beyond_time/models/card_3d.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class HorizontalCards extends StatelessWidget {
  const HorizontalCards({super.key, required this.data});

  final List<String> data;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) => Card3DWidget(
                      key: key,
                      onTap: () {},
                      card: Card3D(title: data[index]),
                      index: index,
                    )),
          )
        ],
      );
}

class Card3DWidget extends StatefulWidget {
  const Card3DWidget(
      {super.key,
      required this.card,
      required this.onTap,
      required this.index});

  final Card3D card;
  final Function() onTap;
  final int index;
  

  @override
  State<StatefulWidget> createState() => Card3DWidgetState();
}

class Card3DWidgetState extends State<Card3DWidget> {
  late Tuple2<int, bool> isTapped;

  @override
  initState() {
    isTapped = const Tuple2(-1, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          widget.onTap();
          setState(() {
            isTapped = Tuple2(widget.index, isTapped.item2 ? false : true);
          });
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: isTapped.item1 == widget.index && isTapped.item2 ? Colors.blueAccent : null,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 15))
              ]),
          child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Center(
                    child: Text(
                  widget.card.title,
                  style: const TextStyle(
                      fontSize: 35,
                      fontFamily: "Calibri",
                      fontWeight: FontWeight.bold),
                )),
              )),
        ),
      );
}
