import 'package:doctor_app/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetailsWidget extends StatefulWidget {
  final PersonalDetails details;
  PersonalDetailsWidget(this.details);

  @override
  _PersonalDetailsWidgetState createState() => _PersonalDetailsWidgetState();
}

class _PersonalDetailsWidgetState extends State<PersonalDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "PhoneNumber",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !widget.details.phone.edit
                  ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Enter phone number',
                            contentPadding: EdgeInsets.all(20)),
                        onChanged: (val) {
                          widget.details.phone.data = val;
                        },
                      ),
                    )
                  : Container(
                      width: 120,
                      child: Text(
                        widget.details.phone.data,
                      ),
                    ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.details.phone.edit = !widget.details.phone.edit;
                    });
                  },
                  child: Image.asset("assets/editIcon.png"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "EmailAddress",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !widget.details.email.edit
                  ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Enter email Address',
                            isDense: true,
                            contentPadding: EdgeInsets.all(20)),
                        onChanged: (val) {
                          widget.details.email.data = val;
                        },
                      ),
                    )
                  : Container(
                      width: 120,
                      child: Text(
                        widget.details.email.data,
                      ),
                    ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.details.email.edit = !widget.details.email.edit;
                    });
                  },
                  child: Image.asset("assets/editIcon.png"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Address",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !widget.details.address.edit
                  ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Enter Address",
                            isDense: true,
                            contentPadding: EdgeInsets.all(20)),
                        onChanged: (val) {
                          widget.details.address.data = val;
                        },
                      ),
                    )
                  : Container(
                      width: 90,
                      child: Text(
                        widget.details.address.data,
                      ),
                    ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.details.address.edit =
                          !widget.details.address.edit;
                    });
                  },
                  child: Image.asset("assets/editIcon.png"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "City",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !widget.details.city.edit
                  ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Enter city number',
                            isDense: true,
                            contentPadding: EdgeInsets.all(20)),
                        onChanged: (val) {
                          widget.details.city.data = val;
                        },
                      ),
                    )
                  : Container(
                      width: 60,
                      child: Text(
                        widget.details.city.data,
                      ),
                    ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.details.city.edit = !widget.details.city.edit;
                    });
                  },
                  child: Image.asset("assets/editIcon.png"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "State",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !widget.details.state.edit
                  ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Enter state ',
                            isDense: true,
                            contentPadding: EdgeInsets.all(20)),
                        onChanged: (val) {
                          widget.details.state.data = val;
                        },
                      ),
                    )
                  : Container(
                      width: 69,
                      child: Text(
                        widget.details.state.data,
                      ),
                    ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.details.state.edit = !widget.details.state.edit;
                    });
                  },
                  child: Image.asset("assets/editIcon.png"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pin Code",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !widget.details.preCode.edit
                  ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Enter postal code',
                            isDense: true,
                            contentPadding: EdgeInsets.all(20)),
                        onChanged: (val) {
                          widget.details.preCode.data = val;
                        },
                      ),
                    )
                  : Container(
                      width: 90,
                      child: Text(
                        widget.details.preCode.data,
                      ),
                    ),
              InkWell(
                  onTap: () {
                    setState(() {
                      widget.details.preCode.edit =
                          !widget.details.preCode.edit;
                    });
                  },
                  child: Image.asset("assets/editIcon.png"))
            ],
          ),
        ],
      ),
    );
  }
}
