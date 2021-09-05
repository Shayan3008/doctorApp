import 'package:flutter/material.dart';
import 'package:doctor_app/models/patient.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class PatientCard extends StatelessWidget {
  final Patient p;
  PatientCard(this.p);
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
      padding: const EdgeInsets.all(4.0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Card(
                  elevation: 5,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Container(
                      child: Text(
                        DateTime.now().day.toString(),
                        style: TextStyle(
                          color: HexColor('0B556F'),
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
                  style: TextStyle(
                    color: HexColor('0B556F'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  DateTime.now().year.toString(),
                  style: TextStyle(
                    color: HexColor('0B556F'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
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
                        color: Colors.black,
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
                  height: 6,
                ),
                Row(
                  children: [
                    Container(
                      // width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.05)),
                      child: Row(
                        children: [
                          Icon(Icons.schedule),
                          Text('2:30 pm,',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#04C5C2'))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.05)),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            'old',
                            style: TextStyle(color: HexColor('#0B556F')),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icon1.png',
                            scale: 1.8,
                          ),
                          Text(
                            p.paymentMethod,
                            style: TextStyle(color: HexColor('#0B556F')),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.call,
                    size: 20,
                  ),
                  Text('#465891'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
