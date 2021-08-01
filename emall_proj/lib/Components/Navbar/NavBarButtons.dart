import 'dart:developer';

import 'package:emall_proj/Components/EnumHolders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class NavBarButtons extends StatefulWidget {
  String title;
  Widget screen;
  NavBarButtons(String this.title, this.screen, {Key? key}) : super(key: key);

  @override
  _NavBarButtonsState createState() => _NavBarButtonsState();
}

class _NavBarButtonsState extends State<NavBarButtons> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.screen));
      },
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                  color: MyColor.White,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
