import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.children, required this.fab});

  final List<Widget> children;
  final bool fab;

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () => {},
      child: SizedBox(
        width: double.infinity - 40,
              height: 240,
        child: Stack(
          children: [
            Container(
              width: double.infinity - 40,
              height: 200,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ...children
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0,1.2),
                child: FloatingActionButton(
                  onPressed: () {},
                  elevation: 12,
                  child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ));
}
