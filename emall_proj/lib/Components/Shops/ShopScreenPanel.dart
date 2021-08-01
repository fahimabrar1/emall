import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:emall_proj/Components/Shops/ShopItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';
import '../MyGlobalVariables.dart';

class ShopPanel extends StatefulWidget {
  const ShopPanel({Key? key}) : super(key: key);

  @override
  _ShopPanelState createState() => _ShopPanelState();
}

class _ShopPanelState extends State<ShopPanel> {
  List<ShopItemDataHolder> shopitemdataholder = [
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_2.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_5.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_2.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_5.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "images/products/product_1.jpg"),
  ];
  int counter = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: NavBar(),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
                left: borderMargin,
                right: borderMargin,
                top: borderMargin / 2,
                bottom: borderMargin / 2),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  ShopItemDataHolder sdh;
                  try {
                    sdh = ShopItemDataHolder(
                        title: shopitemdataholder[index].title,
                        imgPath: shopitemdataholder[index].imgPath);
                  } catch (Exception) {
                    sdh = ShopItemDataHolder(
                        title: "No Shop",
                        imgPath: "images/products/product_1.jpg");
                  }

                  return ShopItem(shopItemDataHolder: sdh);
                },
                childCount: counter,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: (counter == shopitemdataholder.length)
                ? Container()
                : Container(
                    margin: EdgeInsets.only(bottom: borderMargin / 2),
                    //color: Colors.blue,
                    child: Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all<Color>(
                                  MyColor.White.withOpacity(0)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.only(
                                      left: 35,
                                      right: 35,
                                      top: 25,
                                      bottom: 25)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(
                                          color: MyColor.lightGreyBorder,
                                          width: 1.5)))),
                          onPressed: _increaseChildCount,
                          child: Text(
                            "Load More",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: MyColor.Black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: FooterPanel(),
          ),
        ],
      ),
    );
  }

  void _increaseChildCount() {
    setState(() {
      counter += 5;
    });
  }
}
