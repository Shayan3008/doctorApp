import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoTab2 extends StatelessWidget {
  final List<disease> rates = [
    disease(
        image: Image.asset(
          'assets/blood.png',
        ),
        cause: 'Blood Pressue',
        level: '1056748'),
    disease(
        image: Image.asset(
          'assets/pulse.png',
        ),
        cause: 'Pulse',
        level: '1056'),
    disease(
        image: Image.asset(
          'assets/gluco.png',
        ),
        cause: 'Sugar Level',
        level: '10567489'),
    disease(
        image: Image.asset(
          'assets/oxygenIcon.png',
        ),
        cause: 'Spo',
        level: '16748'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Image',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                ),
                Image.asset('assets/image.png'),
                Container(
                  padding: EdgeInsets.all(2),
                ),
                Image.asset('assets/image.png'),
                Container(
                  padding: EdgeInsets.all(2),
                ),
                Image.asset('assets/image.png'),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.grey,
                  ),
                ),
                SizedBox(width: 7),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.grey[200],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Recent Records",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
            child: ListView(
              children: rates
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            e.image,
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(width: 75, child: Text(e.cause)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(
                              // color: Colors.red,
                              width: 120,
                              child: Text(e.level, textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class disease {
  Image image;
  String cause, level;
  disease({required this.image, required this.cause, required this.level});
}
