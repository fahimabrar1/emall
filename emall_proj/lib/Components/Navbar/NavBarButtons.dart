import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class NavBarButtons extends StatefulWidget {
  final String title;
  final Widget screen;
  NavBarButtons(this.title, this.screen, {Key? key}) : super(key: key);

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
