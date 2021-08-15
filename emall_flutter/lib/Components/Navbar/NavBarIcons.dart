import 'package:emall_proj/Components/Cart/Cart.dart';
import 'package:emall_proj/Components/EnumHolders.dart';
import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Screens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavBarIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final NavbBarIconsType iconType;
  NavBarIcon(this.iconType, this.icon, this.color, {Key? key})
      : super(key: key);

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
              switch (widget.iconType) {
                case NavbBarIconsType.search:
                  return SearchButton();
                  break;
                case NavbBarIconsType.cart:
                  return CartAlertDialog();
                  break;
                case NavbBarIconsType.acount:
                  return LoginAlertDialog();
                  break;
              }
            },
          );
        },
        icon: Icon(
          widget.icon,
          color: widget.color,
        ));
  }
}

class LoginAlertDialog extends StatelessWidget {
  const LoginAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Retrieve the text the that user has entered by using the
      // TextEditingController.
      content: LoginScreenPanel(),
      backgroundColor: MyColor.White.withOpacity(0.0),
      elevation: 0,
    );
  }
}

class CartAlertDialog extends StatelessWidget {
  const CartAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Retrieve the text the that user has entered by using the
      // TextEditingController.
      content: Cart(),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Retrieve the text the that user has entered by using the
      // TextEditingController.
      content: Text("Search"),
    );
  }
}
