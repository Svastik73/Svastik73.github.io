import 'dart:typed_data';
import 'package:catalog/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // returns drawer to the calling function in home page!
      backgroundColor: Color.fromARGB(255, 125, 152, 215),
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFF8BC34A)),
                  arrowColor: Colors.blueAccent,
                  currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/download.jpeg")),
                  margin: EdgeInsets.zero,
                  accountName: Text("Svastik Kanwar"),
                  accountEmail: Text("kanwar7svastik@gmail.com")),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  // style widget take TextStyle widget as input widget!
                  color: Colors.black, fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
              ),
              title: Text(
                " Profile",
                style: TextStyle(
                  // style widget take TextStyle widget as input widget!
                  color: Colors.black, fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone,
              ),
              title: Text(
                "Contact us!",
                style: TextStyle(
                  // style widget take TextStyle widget as input widget!
                  color: Colors.black, fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
