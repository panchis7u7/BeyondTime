import 'package:flutter/material.dart';
//import 'package:sensors_plus/sensors_plus.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key, required this.id, required this.title, required this.onTap})
      : super(key: key);

  final String id;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: id,
                  child: Material(
                    child: InkWell(
                      onTap: () => onTap(context, this),
                      child: Container(
                        width: double.infinity - 40,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 6],
                                colors: [Colors.purple, Colors.orangeAccent]),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  offset: Offset(0, 5)),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: <Widget>[
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CATs Training",
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 57, top: 0.5),
                                    child: Text("1234",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const <Widget>[
                                      SizedBox(width: 2),
                                      Text(
                                        "02/21",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      SizedBox(width: 30),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: "Expires Date ",
                                            style: TextStyle(
                                                fontSize: 10, color: Colors.white)),
                                        TextSpan(
                                            text: "07/24",
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.white))
                                      ])),
                                      SizedBox(width: 2)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
}

/*class ActivityCard extends StatefulWidget {
  const ActivityCard({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final Function onTap;
  //final Function(BuildContext context, ActivityCard card) onTap;

  @override
  State<StatefulWidget> createState() => ActivityCardState();
}

class ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => widget.onTap(context, widget),
                    child: Container(
                      width: double.infinity - 40,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 6],
                              colors: [Colors.purple, Colors.orangeAccent]),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                spreadRadius: 5,
                                offset: Offset(0, 5)),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: <Widget>[
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "CATs Training",
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 57, top: 0.5),
                                  child: Text("1234",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const <Widget>[
                                    SizedBox(width: 2),
                                    Text(
                                      "02/21",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(width: 30),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: "Expires Date ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      TextSpan(
                                          text: "07/24",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white))
                                    ])),
                                    SizedBox(width: 2)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );*/

  /* @override
  Widget build(BuildContext context) => StreamBuilder<GyroscopeEvent>(
        stream: SensorsPlatform.instance.gyroscopeEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            posX += (snapshot.data!.x * 0.1);
            posY += (snapshot.data!.y * 0.1);
          }
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      //..rotateX(posX / 1)
                      ..rotateY(posY / 100),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity - 40,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [
                                    posY,
                                    posY / posY
                                  ],
                                  colors: const [
                                    Colors.purple,
                                    Colors.orangeAccent
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  offset: Offset(posY, posX)
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Test",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: <Widget>[
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "CATs Training",
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 57, top: 0.5),
                                      child: Text("1234",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const <Widget>[
                                        SizedBox(width: 2),
                                        Text(
                                          "02/21",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        SizedBox(width: 30),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: "Expires Date ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white)),
                                          TextSpan(
                                              text: "07/24",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white))
                                        ])),
                                        SizedBox(width: 2)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ); */