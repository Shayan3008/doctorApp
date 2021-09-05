import 'package:flutter/material.dart';
import 'package:doctor_app/models/patient.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AnnouncementCard extends StatelessWidget {
  final Patient p;
  AnnouncementCard(this.p);
  final List<String> months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'june',
    'july',
    'aug',
    'sept',
    'oct',
    'nov',
    'dec',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(0.15),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: HexColor('#0B556F'),
                      child: Container(
                        child: Text(
                          DateTime.now().day.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    months[DateTime.now().month - 1],
                    style: GoogleFonts.roboto(
                      color: HexColor('#0B556F'),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateTime.now().year.toString(),
                    style: GoogleFonts.roboto(
                      color: HexColor('#0B556F'),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        style: GoogleFonts.roboto(
                          color: HexColor('#44BF9D'),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '(${p.gender},${p.age} years)',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    p.description,
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        // width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.withOpacity(0.05)),
                        child: Center(
                          child: Text(
                            '2:30 pm,',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor('#0B556F'),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'assets/doctorIcon.png',
                            scale: 1.7,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Dr.' + p.name,
                            style: GoogleFonts.roboto(
                              color: HexColor('#5DC9EE'),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
