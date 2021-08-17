import 'package:emall_proj/Components/Shops/ShopScreenPanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  String? shopName;
  ShopScreen({this.shopName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShopPanel(shopName),
    );
  }
}
