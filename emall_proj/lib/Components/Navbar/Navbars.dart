import 'dart:developer';
import 'dart:html';

import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Navbar/NavBarButtons.dart';
import 'package:emall_proj/Components/Navbar/NavBarIcons.dart';
import 'package:emall_proj/Screens/HomeScreen.dart';
import 'package:emall_proj/Screens/ShopScreen.dart';
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
  bool isHovered = false;
  String dropdownValue = 'One';
  GlobalKey _key = GlobalKey();

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });

  // void _updateLocation(PointerEvent details) {
  //   setState(() {
  //     x = details.position.dx;
  //     y = details.position.dy;
  //   });
  // }
  void _getOffset(
      PointerEnterEvent pointer, BuildContext context, GlobalKey key) {
    RenderBox? box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    setState(() {
      x = position.dx;
      y = position.dy + 40;
      isHovered = true;
    });
    showMenus(context);
  }

  showMenus(BuildContext context) {
    log("onEnter");

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(x, y, 770, 0),
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

  _disableMenus(PointerExitEvent details) {
    log("onExit");
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> Screens = [HomeScreen(), ShopScreen()];

    return Container(
      //color: Colors.blue,
      height: 80,
      padding: EdgeInsets.only(left: borderMargin, right: borderMargin),
      width: MediaQuery.of(context).size.width,
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
                        key: _key,
                        onEnter: (PointerEnterEvent) =>
                            _getOffset(PointerEnterEvent, context, _key),

                        // onEnter: (PointerEvent) => log("OnEnter"),
                        // onHover: (PointerEvent) => log("OnHover"),
                        // onExit: (PointerEvent) => log("OnExit"),
                        child: Container(
                          //color: Colors.blue,
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
                  NavBarButtons(
                    "Home",
                    Screens.elementAt(0),
                  ),
                  NavBarButtons(
                    "Shop",
                    Screens.elementAt(1),
                  ),
                  NavBarButtons(
                    "Contact Us",
                    Screens.elementAt(0),
                  ),
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
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  double x = 0.0;
  double y = 0.0;
  bool isHovered = false;
  String dropdownValue = 'One';

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });

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

  @override
  Widget build(BuildContext context) {
    final List<Widget> Screens = [HomeScreen(), ShopScreen()];

    return Row(
      children: [
        Container(
          color: MyColor.orange,
          height: 80,
          padding: EdgeInsets.only(left: borderMargin, right: borderMargin),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          NavBarButtons(
                            "Home",
                            Screens.elementAt(0),
                          ),
                          NavBarButtons(
                            "Shop",
                            Screens.elementAt(1),
                          ),
                          NavBarButtons(
                            "Contact Us",
                            Screens.elementAt(0),
                          ),
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
        ),
      ],
    );
  }
}
