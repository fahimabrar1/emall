import 'dart:developer';

import 'package:emall_proj/Components/EnumHolders.dart';
import 'package:emall_proj/Components/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavBarIcon extends StatefulWidget {
  IconData icon;
  NavBarIcon(IconData this.icon, {Key? key}) : super(key: key);

  @override
  _NavBarIconState createState() => _NavBarIconState();
}

class _NavBarIconState extends State<NavBarIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => log("Pressed Icon"),
        icon: Icon(
          widget.icon,
          color: MyColor.White,
        ));
  }
}
