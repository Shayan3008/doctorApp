import 'package:doctor_app/provider/modeChange.dart';
import 'package:doctor_app/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ModeChange>(context);
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0), children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.18,
          child: DrawerHeader(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      child: Image.asset('assets/profile1.png'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Text(
                      'Dr Habbib',
                      style: pro.theme.textTheme.bodyText1!.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                child: Transform.translate(
                    offset: Offset(40, 0),
                    child: Image.asset('assets/arrowBack.png')),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
        ),
        Card(
          elevation: 0,
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => ProfilePage()));
            },
            title: Text(
              'View profile',
              style:
                  pro.theme.textTheme.headline1!.copyWith(color: Colors.black),
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: ListTile(
            title: Text(
              'Review',
              style:
                  pro.theme.textTheme.headline1!.copyWith(color: Colors.black),
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: ListTile(
            title: Text(
              'F.A.Q',
              style:
                  pro.theme.textTheme.headline1!.copyWith(color: Colors.black),
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: ListTile(
            title: Text(
              'Support',
              style:
                  pro.theme.textTheme.headline1!.copyWith(color: Colors.black),
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: ListTile(
            title: Text(
              'Privacy Policy',
              style:
                  pro.theme.textTheme.headline1!.copyWith(color: Colors.black),
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: ListTile(
            title: Text(
              'Know About Medishala',
              style:
                  pro.theme.textTheme.headline1!.copyWith(color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
