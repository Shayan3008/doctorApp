import 'dart:convert';

import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/widgets/AppBar.dart';
import 'package:doctor_app/widgets/BottomNavigationBarWidget.dart';
import 'package:doctor_app/widgets/CareerDetailsPage.dart';
import 'package:doctor_app/widgets/PersonalDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  Color color1 = HexColor('#04C5C2');
  Color color2 = Colors.white;
  Color text1 = Colors.black;
  Color text2 = Colors.white;
  late TabController _controller;
  late PersonalDetails details;
  bool loading = false;
  late CareerDetails details2;
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
    final pro = Provider.of<ModeChange>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pro.darkMode ? Colors.grey[400] : HexColor('#F1F5F4'),
      // bottomNavigationBar: BottomNavigationBarWidget(),
      appBar: AppBarWidget('Profile'),
      body: !loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: (size.height * 0.82) - 56,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.15),
                        )
                      ]),
                  child: Center(
                    child: Container(
                      width: (size.width * 0.9) * 0.99,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Transform.translate(
                              offset: Offset(0, -15),
                              child: CircleAvatar(
                                maxRadius: 60,
                                child: Image.asset(
                                  'assets/profile1.png',
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dr Manish Jain',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/editIcon.png',
                                ),
                              ],
                            ),
                          ),
                          LayoutBuilder(
                            builder: (ctx, cons) => Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: size.height * 0.12,
                                    width: cons.maxWidth * 0.32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 9),
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.15),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Fees',
                                              style: GoogleFonts.roboto(
                                                fontSize: 13,
                                                color: HexColor('#0B556F'),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/editIcon.png',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset('assets/rupeeIcon.png',
                                                scale: 1.7),
                                            Text(
                                              '300',
                                              style: GoogleFonts.roboto(
                                                fontSize: 24,
                                                color: HexColor('#0B556F'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: size.height * 0.12,
                                    width: cons.maxWidth * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 9),
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.15),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Degree',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  color: HexColor('#0B556F'),
                                                ),
                                              ),
                                              Image.asset(
                                                'assets/editIcon.png',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/capIcon.png',
                                                scale: 1.7,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  'MBBS, MD, BUMS',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18,
                                                    color: HexColor('#0B556F'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: size.width * 0.9,
                            child: TabBar(
                              onTap: (index) {
                                Color temp;
                                if (index == 0 && text2 == Colors.black) {
                                  setState(() {
                                    temp = color1;
                                    color1 = color2;
                                    color2 = temp;
                                    temp = text1;
                                    text1 = text2;
                                    text2 = temp;
                                  });
                                } else if (index == 1 &&
                                    text1 == Colors.black) {
                                  setState(() {
                                    temp = color1;
                                    color1 = color2;
                                    color2 = temp;
                                    temp = text1;
                                    text1 = text2;
                                    text2 = temp;
                                  });
                                }
                              },
                              indicatorColor: Colors.transparent,
                              tabs: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.36,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: color1,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.15),
                                        ),
                                      ]),
                                  child: Tab(
                                    child: Text(
                                      'Personal Details',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: text2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.36,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: color2),
                                  child: Tab(
                                    child: Text(
                                      'Career Details',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: text1,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                              controller: _controller,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                PersonalDetailsWidget(details),
                                CarrerDetailWidget(details2),
                              ],
                              controller: _controller,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Change Password',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: HexColor('#5DC9EE'),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Future<void> getData() async {
    final String? resp = await DefaultAssetBundle.of(context)
        .loadString("assets/patientPersonal.json");
    if (resp != null) {
      final rep = jsonDecode(resp) as Map<String, dynamic>;
      details = PersonalDetails(
        preCode: Detail(rep["PreCode"], true),
        address: Detail(rep["Address"], true),
        city: Detail(rep["City"], true),
        email: Detail(rep["Email"], true),
        phone: Detail(rep["Phone"], true),
        state: Detail(rep["State"], true),
      );
    }
    final String? resps = await DefaultAssetBundle.of(context)
        .loadString("assets/careerDetail.json");
    if (resps != null) {
      final reps = jsonDecode(resps) as Map<String, dynamic>;
      details2 = CareerDetails(
        degrees: Detail(reps["Degrees"], true),
        hospitalAttention: Detail(reps["HospitalAttention"], true),
        proffesionalMembership: Detail(reps["ProffessionalMemberShip"], true),
        awards: DetailList(["Expertiese", "Expertiese2"], true),
        expertiese: DetailList(["Expertiese", "Award2"], true),
      );
    }

    setState(() {
      loading = true;
    });
  }
}
