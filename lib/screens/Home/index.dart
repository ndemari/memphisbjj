import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memphisbjj/screens/MyProfile/MyProfileScreen.dart';
import 'package:memphisbjj/screens/ScheduleMain/ViewSchedule/index.dart';
import 'package:memphisbjj/theme/style.dart';
import 'package:memphisbjj/screens/ScheduleMain/index.dart';
import 'package:memphisbjj/screens/Login/index.dart';
import 'package:memphisbjj/utils/UserItem.dart';
import 'package:memphisbjj/screens/Admin/index.dart';

class HomeScreen extends StatefulWidget {
  final UserItem user;
  final FirebaseUser anonymousUser;

  const HomeScreen({Key key, this.user, this.anonymousUser}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list;
    if (widget.anonymousUser != null && widget.anonymousUser.isAnonymous) {
      list = _createMemberList(context: context, widget: widget);
    } else if (widget.user != null && widget.user.roles.admin) {
      list = _createAdminList(context: context, widget: widget);
    } else if (widget.user != null && widget.user.roles.subscriber) {
      list = _createMemberList(context: context, widget: widget);
    }

    return Scaffold(
      floatingActionButton: widget.anonymousUser != null
          ? Container(
              height: 85.0,
              width: 85.0,
              child: FloatingActionButton(
                child: Text("SIGN UP"),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
              ),
            )
          : Container(width: 0.0, height: 0.0),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text("Memphis Judo & Jiu-Jitsu"),
          expandedHeight: 175.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Image.asset(
              "assets/app-drawer-main.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 175.0,
          delegate: SliverChildListDelegate(
            list,
          ),
        ),
      ]),
    );
  }
}

List<Widget> _createAdminList({BuildContext context, HomeScreen widget}) {
  return [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScheduleMainScreen(
                    user: widget.user.fbUser,
                    locationName: "Bartlett",
                  ),
            ),
          );
        },
        child: Container(
          decoration:
              buildBoxDecoration(Colors.black38, "assets/member-benefits.jpg"),
          child: Center(
            child: Text(
              "SCHEDULE",
              style: const TextStyle(
                  color: const Color(0XFFFFFFFF),
                  fontSize: 32.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: buildBoxDecoration(Colors.black38, "assets/about-us.jpg"),
        child: Center(
          child: Text(
            "SOCIAL MEDIA",
            style: const TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: buildBoxDecoration(Colors.black38, "assets/styles.jpg"),
        child: Center(
          child: Text(
            "STYLES",
            style: const TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: buildBoxDecoration(Colors.black38, "assets/about-us.jpg"),
        child: Center(
          child: Text(
            "INSTRUCTORS",
            style: const TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfileScreen(
                        user: widget.user.fbUser,
                      ),
                ),
              );
            },
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.user),
                SizedBox(width: 10),
                Text(
                  "My Profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Icon(FontAwesomeIcons.tasks),
              SizedBox(width: 10),
              Text(
                "My Classes",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(height: 15),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.infoCircle),
                SizedBox(width: 10),
                Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminScreen(),
                ),
              );
            },
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.userCog),
                SizedBox(width: 10),
                Text(
                  "Admin Tools",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  ];
}

List<Widget> _createMemberList({BuildContext context, HomeScreen widget}) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScheduleMainScreen(
                    user: widget.user.fbUser,
                    locationName: "Bartlett",
                  ),
            ),
          );
        },
        child: Container(
          decoration:
              buildBoxDecoration(Colors.black38, "assets/member-benefits.jpg"),
          child: Center(
            child: Text(
              "SCHEDULE",
              style: const TextStyle(
                  color: const Color(0XFFFFFFFF),
                  fontSize: 32.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: buildBoxDecoration(Colors.black38, "assets/about-us.jpg"),
        child: Center(
          child: Text(
            "SOCIAL MEDIA",
            style: const TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: buildBoxDecoration(Colors.black38, "assets/styles.jpg"),
        child: Center(
          child: Text(
            "STYLES",
            style: const TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            buildBoxDecoration(Colors.black38, "assets/about-us.jpg"),
        child: Center(
          child: Text(
            "INSTRUCTORS",
            style: const TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 32.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfileScreen(
                        user: widget.user.fbUser,
                      ),
                ),
              );
            },
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.user),
                SizedBox(width: 10),
                Text(
                  "My Profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ViewScheduleScreen(user: widget.user.fbUser)));
            },
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.tasks),
                SizedBox(width: 10),
                Text(
                  "My Classes",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.infoCircle),
                SizedBox(width: 10),
                Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    ),
  ];
}