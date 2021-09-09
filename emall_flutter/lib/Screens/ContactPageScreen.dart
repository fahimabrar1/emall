import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPageScreen extends StatefulWidget {
  const ContactPageScreen({Key? key}) : super(key: key);

  @override
  _ContactPageScreenState createState() => _ContactPageScreenState();
}

class _ContactPageScreenState extends State<ContactPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            color: MyColor.lightAmberBorderBackGround,
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavBar(drawerCallback: () {
                    setState(() {
                      Scaffold.of(context).openDrawer();
                    });
                  }),
                  Container(
                    height: 600,
                    child: Center(
                      child: Text("Contact Page"),
                    ),
                  ),
                  FooterPanel(),
                ]),
          ),
        ),
      ),
    );
  }
}
