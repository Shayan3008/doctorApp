import 'dart:convert';
import 'package:doctor_app/models/patient.dart';
import 'package:doctor_app/widgets/AnnouncementsCard.dart';
import 'package:doctor_app/widgets/Drawer.dart';
import 'package:doctor_app/widgets/PatientCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  bool init = false;
  List<Patient> patient = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor('#F1F5F4'),
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: HexColor('#F1F5F4'),
        elevation: 0,
        title: FittedBox(
          child: Text(
            'Announcements',
            style: GoogleFonts.roboto(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.search),
                Icon(Icons.notifications),
                CircleAvatar(
                  backgroundColor: HexColor('#57C4A6'),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: !init
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: size.width * 0.4,
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
                              'Upcoming First',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.arrow_downward),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/filterIcon.png',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext ctx, int index) =>
                        AnnouncementCard(patient[index]),
                    itemCount: patient.length,
                  ),
                )
              ],
            ),
    );
  }

  Future<void> getData() async {
    final String? resp =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    if (resp != null) {
      final response = json.decode(resp) as Map<String, dynamic>;
      print(response["name"]);
      response.forEach((key, value) {
        Patient temp = Patient(
          name: value["name"],
          gender: value["gender"],
          age: value["age"],
          description: value["description"],
          paymentMethod: value["payment"],
          status: value["status"],
        );
        patient.add(temp);
      });

      setState(() {
        init = true;
      });
    }
  }
}
