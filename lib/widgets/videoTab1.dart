import 'package:flutter/material.dart';

class VideoTab1 extends StatelessWidget {
  final List<work> list = [
    work('Gender', 'Female', Image.asset('assets/genderIcon.png', scale: 0.8)),
    work('age', '32', Image.asset('assets/agingIcon.png', scale: 0.8)),
    work('Weight', '62', Image.asset('assets/weightIcon.png', scale: 0.8)),
    work(
        'Complaints',
        'Fever for 5 days',
        Image.asset(
          'assets/complaintIcon.png',
          scale: 0.8,
        )),
    work('History', 'high blood pressure',
        Image.asset('assets/historyIcon.png', scale: 0.8)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      e.icon1,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Container(width: 75, child: Text(e.string1)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Container(
                        // color: Colors.red,
                        width: 120,
                        child: Text(e.string2, textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class work {
  String string1, string2;
  Image icon1;
  work(this.string1, this.string2, this.icon1);
}
