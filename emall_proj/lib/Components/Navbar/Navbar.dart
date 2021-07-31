import 'dart:developer';

import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Navbar/NavBarButtons.dart';
import 'package:emall_proj/Components/Navbar/NavBarIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransparentNavBar extends StatefulWidget {
  const TransparentNavBar({Key? key}) : super(key: key);

  @override
  _TransparentNavBarState createState() => _TransparentNavBarState();
}

class _TransparentNavBarState extends State<TransparentNavBar> {
  double x = 0.0;
  double y = 0.0;
  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  showMenus(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(650, 80, 770, 0),
      items: [
        PopupMenuItem(
          child: Text("Item 1"),
        ),
        PopupMenuItem(
          child: Text("Item 2"),
        ),
        PopupMenuItem(
          child: Text("Item 3"),
        ),
      ],
    );
  }

  bool isHovered = false;
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      height: 80,
      margin: EdgeInsets.only(left: borderMargin, right: borderMargin),
      width: MediaQuery.of(context).size.width - 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  TextButton(
                    child: Text(
                      "eMall",
                      style: GoogleFonts.poppins(
                          color: MyColor.White,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0)),
                    ),
                    onPressed: () {},
                  ),
                ]),
              ),
              Expanded(
                flex: 2,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: MouseRegion(
                        onEnter: (Event) => _updateLocation,
                        onHover: (Event) => showMenus(context),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Category',
                                style: GoogleFonts.poppins(
                                    color: MyColor.White,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  NavBarButtons("Home"),
                  NavBarButtons("Shop"),
                  NavBarButtons("Contact Us"),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NavBarIcon(Icons.search),
                    SizedBox(
                      width: 20,
                    ),
                    NavBarIcon(Icons.shopping_cart_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    NavBarIcon(Icons.account_circle_outlined),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
