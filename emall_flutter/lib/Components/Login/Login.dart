import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Screens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/collection_banners/collection_banner_1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.only(left: borderMargin, right: borderMargin),
              child: Row(
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
                ],
              ),
            ),
            LoginScreenPanel(),
          ],
        ),
      ),
    );
  }
}
