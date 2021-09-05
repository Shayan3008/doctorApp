import 'dart:convert';

import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/widgets/AppBar.dart';
import 'package:doctor_app/widgets/BottomNavigationBarWidget.dart';
import 'package:doctor_app/widgets/Drawer.dart';
import 'package:doctor_app/widgets/PatientCard.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor_app/models/patient.dart';
import 'package:doctor_app/widgets/cardInfo.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  static const routeName = '/';
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  bool switchValue = false;
  bool init = false;
  bool switch1 = false;
  bool switch2 = false;
  TabController? _controller;
  Color color1 = HexColor('#04C5C2');
  Color text1 = Colors.white;
  Color text2 = Colors.black;
  Color color2 = Colors.transparent;
  List<Patient> patient = [];
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    Future.delayed(Duration.zero).then((value) {
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<ModeChange>(context);
    return Scaffold(
      backgroundColor: pro.theme.scaffoldBackgroundColor,
      drawer: DrawerWidget(),
      appBar: AppBarWidget(
        'DashBoard',
      ),
      body: !init
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Overview',
                          style: pro.theme.textTheme.bodyText1,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-2, 5),
                                  color: Colors.grey.withOpacity(0.15)),
                            ],
                            borderRadius: BorderRadius.circular(90),
                            color: pro.theme.scaffoldBackgroundColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90)),
                            // color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Today',
                                  style:
                                      pro.theme.textTheme.bodyText2!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.black,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardInfo(
                          text1: 'Appointments',
                          text2: '12',
                          imagePath: 'assets/icon3.png',
                        ),
                        CardInfo(
                          text1: 'Earnings',
                          text2: '2500',
                          imagePath: 'assets/icon1.png',
                        ),
                        CardInfo(
                          text1: 'Views',
                          text2: '12',
                          imagePath: 'assets/icon2.png',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HexColor('#5DC9EE').withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 12, top: 2),
                            child: Image.asset(
                              'assets/docPic.png',
                              // fit: BoxFit.cover,

                              // scale:,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Do you know\nWhy Medishala is useful?',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Check it Out',
                                        style: GoogleFonts.roboto(
                                          color: HexColor('#0B556F'),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        shape: CircleBorder(),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 8,
                                      width: 8,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        shape: CircleBorder(),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 8,
                                      width: 8,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        shape: CircleBorder(),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upcoming Appointments',
                          style: pro.theme.textTheme.headline2,
                        ),
                        Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 6),
                                  blurRadius: 3,
                                  color: Colors.grey.withOpacity(0.15),
                                )
                              ],
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              'View All',
                              style: GoogleFonts.roboto(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TabBar(
                            onTap: (int tab) {
                              print(tab);
                              if (tab == 0) {
                                setState(() {
                                  text1 = Colors.white;
                                  color1 = HexColor('#04C5C2');
                                  text2 = Colors.black;
                                  color2 = Colors.white;
                                });
                              } else {
                                setState(() {
                                  text1 = Colors.black;
                                  text2 = Colors.white;
                                  color1 = Colors.white;
                                  color2 = HexColor('#04C5C2');
                                });
                              }
                            },
                            indicatorColor: Colors.transparent,
                            tabs: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                    color: color1,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Tab(
                                  child: Text(
                                    'MediShala',
                                    style: TextStyle(
                                      color: text1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                    color: color2,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Tab(
                                    child: Text('Clinic',
                                        style: TextStyle(
                                          color: text2,
                                        ))),
                              ),
                            ],
                            controller: _controller,
                          ),
                        ),
                        Image.asset(
                          'assets/icon4.png',
                          scale: 0.8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext ctx, int index) =>
                            PatientCard(patient[index]),
                        itemCount: patient.length,
                      ),
                    )
                  ],
                ),
              ),
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
      print(patient);
    }
  }
}
