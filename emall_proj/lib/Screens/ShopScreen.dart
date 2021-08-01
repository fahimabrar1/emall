import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/Shops/ShopScreenPanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShopPanel(),
    );
  }
}
