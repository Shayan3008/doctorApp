import 'package:doctor_app/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarrerDetailWidget extends StatefulWidget {
  final CareerDetails details;
  CarrerDetailWidget(this.details);

  @override
  _CarrerDetailWidgetState createState() => _CarrerDetailWidgetState();
}

class _CarrerDetailWidgetState extends State<CarrerDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Degrees",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                !widget.details.degrees.edit
                    ? Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Enter Degree Details',
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)),
                          onChanged: (val) {
                            widget.details.degrees.data = val;
                          },
                        ),
                      )
                    : Container(
                        width: 118,
                        child: Text(
                          widget.details.degrees.data,
                        ),
                      ),
                InkWell(
                    onTap: () {
                      setState(() {
                        widget.details.degrees.edit =
                            !widget.details.degrees.edit;
                      });
                    },
                    child: Image.asset(
                      "assets/editIcon.png",
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  child: Text(
                    "HospitalAffilation",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                !widget.details.hospitalAttention.edit
                    ? Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Enter hospital attention',
                              isDense: true,
                              contentPadding: EdgeInsets.all(20)),
                          onChanged: (val) {
                            widget.details.hospitalAttention.data = val;
                          },
                        ),
                      )
                    : Container(
                        width: 125,
                        child: Text(
                          widget.details.hospitalAttention.data,
                        ),
                      ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.details.hospitalAttention.edit =
                          !widget.details.hospitalAttention.edit;
                    });
                  },
                  child: Image.asset(
                    "assets/editIcon.png",
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Experties",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 30,
                  width: 120,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !widget.details.expertiese.edit
                            ? Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                  onChanged: (val) {
                                    widget.details.expertiese.data[index] = val;
                                  },
                                ),
                              )
                            : Text(widget.details.expertiese.data[index]),
                      ],
                    ),
                    itemCount: widget.details.expertiese.data.length,
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        widget.details.expertiese.edit =
                            !widget.details.expertiese.edit;
                      });
                    },
                    child: Image.asset(
                      "assets/editIcon.png",
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    "Proffesional MemberShip",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                !widget.details.proffesionalMembership.edit
                    ? Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Enter proffesional Membership',
                              isDense: true,
                              contentPadding: EdgeInsets.all(20)),
                          onChanged: (val) {
                            widget.details.proffesionalMembership.data = val;
                          },
                        ),
                      )
                    : Container(
                        width: 160,
                        child:
                            Text(widget.details.proffesionalMembership.data)),
                InkWell(
                    onTap: () {
                      setState(() {
                        widget.details.proffesionalMembership.edit =
                            !widget.details.proffesionalMembership.edit;
                      });
                    },
                    child: Image.asset(
                      "assets/editIcon.png",
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Awards",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.details.awards.data[index],
                        ),
                      ],
                    ),
                    itemCount: widget.details.awards.data.length,
                  ),
                ),
                Image.asset(
                  "assets/editIcon.png",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
