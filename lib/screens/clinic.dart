import 'dart:ui';
import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/widgets/AppBar.dart';
import 'package:doctor_app/widgets/Drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/clinic.dart';
import 'package:google_fonts/google_fonts.dart';

class ClinicScreen extends StatefulWidget {
  @override
  _ClinicScreenState createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  bool switched = false;
  final List<Clinic> user = [
    Clinic(
      name: 'Clinic One',
      appointment: '25 Appointments',
      patient: '30 patients',
    ),
    Clinic(
      name: 'Clinic One',
      appointment: '25 Appointments',
      patient: '30 patients',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    return Scaffold(
      backgroundColor: pro.theme.scaffoldBackgroundColor,
      drawer: DrawerWidget(),
      appBar: AppBarWidget('Clinic'),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 28.85,
                      width: 190,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search clinic',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: HexColor('#0B556F'),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            user.isEmpty
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      itemCount: user.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-2, 5),
                                  color: Colors.grey.withOpacity(0.15)),
                            ],
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.only(top: 2, bottom: 2),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: HexColor('#0B556F'),
                                        child:
                                            Image.asset('assets/monitor2.png'),
                                      ),
                                      title: Text(
                                        user[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(user[index].appointment +
                                          '|' +
                                          user[index].patient),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
