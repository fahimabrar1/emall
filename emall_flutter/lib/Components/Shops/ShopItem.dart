import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class ShopItemDataHolder {
  String title;
  String imgPath;

  ShopItemDataHolder({required this.title, required this.imgPath});
}

class ShopItem extends StatefulWidget {
  final ShopItemDataHolder shopItemDataHolder;
  ShopItem({Key? key, required this.shopItemDataHolder}) : super(key: key);

  @override
  _ShopItemState createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 200,
              width: 200,
              child: Image.network(
                widget.shopItemDataHolder.imgPath,
                fit: BoxFit.fill,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
          ),
          Container(
            width: 200,
            padding: EdgeInsets.all(5),
            child: Text(
              widget.shopItemDataHolder.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: MyColor.Black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
