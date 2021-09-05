import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatefulWidget {
  final String day;
  CardWidget(this.day);
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  List<bool> switches = [];
  List<Widget> list = [];
  bool loading = false;
  void addValue(BuildContext context) {
    final size = MediaQuery.of(context).size;
    list.add(
      Row(
        children: [
          SizedBox(
            height: 6,
          ),
          Container(
            height: 40,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.15),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateTime.now().hour.toString() +
                      ':' +
                      DateTime.now().minute.toString(),
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                  ),
                ),
                Icon(Icons.arrow_downward),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Container(
            height: 40,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.15),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateTime.now().hour.toString() +
                      ':' +
                      DateTime.now().minute.toString(),
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                  ),
                ),
                Icon(Icons.arrow_downward),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.1,
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/crossIcon.png',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                addValue(context);
              });
            },
            child: Image.asset(
              'assets/plusSign2.png',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    for (var i = 0; i < 5; i++) switches.add(false);
    Future.delayed(Duration.zero).then((value) {
      addValue(context);
      setState(() {
        loading = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return !loading
        ? Center(
            child: Text('Please wait the cards arer loading'),
          )
        : Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 3,
                    color: Colors.grey.withOpacity(0.15),
                  )
                ],
              ),
              child: Card(
                child: Container(
                  width: size.width * 0.7,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.day,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Switch(
                                value: switches[0],
                                onChanged: (_) {
                                  setState(() {
                                    switches[0] = !switches[0];
                                  });
                                })
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          top: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.3,
                            ),
                            Text(
                              'Tos',
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height *
                                0.07 *
                                list.length +
                            0.0,
                        child: Column(
                          children: list
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: e,
                                  ))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
