import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavBarIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  NavBarIcon(this.icon, this.color, {Key? key}) : super(key: key);

  @override
  _NavBarIconState createState() => _NavBarIconState();
}

class _NavBarIconState extends State<NavBarIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("Contend"),
              );
            },
          );
        },
        icon: Icon(
          widget.icon,
          color: widget.color,
        ));
  }
}
