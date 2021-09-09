import 'dart:convert';
import 'dart:developer';

import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/EnumHolders.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/Models/shopModel.dart';
import 'package:emall_proj/Components/Navbar/NavBarIcons.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:emall_proj/Components/Shops/ShopItem.dart';
import 'package:emall_proj/Screens/ShopScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../MyColors.dart';
import '../MyGlobalVariables.dart';

class ShopPanel extends StatefulWidget {
  String? shopName;
  ShopPanel(this.shopName, {Key? key}) : super(key: key);

  @override
  _ShopPanelState createState() => _ShopPanelState(shopName);
}

class _ShopPanelState extends State<ShopPanel> {
  List<ShopItemDataHolder> shopitemdataholder = [
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_2.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_5.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_1.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_2.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_3.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_4.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_5.jpg"),
    ShopItemDataHolder(
        title: "Shop Name Shop Name Shop Name Shop Name",
        imgPath: "assets/images/products/product_1.jpg"),
  ];
  List<String> dropDownMenu = ["10", "20", "30"];
  String dropdownValue = "10";

  int counter = 10;
  int allshopCounter = 10;
  int incrementByDropdown = 10;
  late Future<List<ShopModel>> shopModelList;
  String? shopName;
  _ShopPanelState(this.shopName);

  TextEditingController myShopSearchControllerText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.shopName);
    if (widget.shopName == null) {
      print("Call");
      shopModelList = fetchShopList();
    } else {
      shopModelList = fetchSingleShop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Builder(
        builder: (context) => CustomScrollView(
          slivers: <Widget>[
            //Navbar In Sliver
            SliverToBoxAdapter(
              child: NavBar(drawerCallback: () {
                setState(() {
                  Scaffold.of(context).openDrawer();
                });
              }),
            ),

            //Search Option In Sliver
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                //color: Colors.red,
                margin: EdgeInsets.only(
                    left: borderMargin, right: borderMargin, top: 50),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            new Flexible(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: myShopSearchControllerText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search..."),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                log("Search : " +
                                    myShopSearchControllerText.text);
                                setState(() {
                                  shopName = myShopSearchControllerText.text;
                                  shopModelList = fetchSingleShop();
                                });
                              },
                              icon: Icon(
                                Icons.search,
                                color: MyColor.orange,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 0.5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Search Grid Settings In Sliver
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                //color: Colors.red,
                margin: EdgeInsets.only(
                    left: borderMargin, right: borderMargin, top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "All Shops ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: MyColor.Black),
                            ),

                            // Text(
                            //   "",
                            //   style: GoogleFonts.poppins(
                            //       fontWeight: FontWeight.w200,
                            //       fontSize: 18,
                            //       color: MyColor.lightGreyBorder),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Show Shows: ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: MyColor.Black),
                            ),
                            Container(
                              child: DropdownButton(
                                value: dropdownValue,
                                items: dropDownMenu.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                    incrementByDropdown = int.parse(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //SliverGrid In Sliver
            //
            SliverPadding(
              padding: EdgeInsets.only(
                  left: borderMargin,
                  right: borderMargin,
                  top: borderMargin / 2,
                  bottom: borderMargin / 2),
              sliver: FutureBuilder<List<ShopModel>>(
                future: shopModelList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none ||
                      !snapshot.hasData) {
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        childCount: counter,
                      ),
                    );
                  }
                  if (snapshot.data!.length == 0) {
                    return SliverToBoxAdapter(child: Container(height: 100));
                  }
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        ShopItemDataHolder sdh;
                        try {
                          sdh = ShopItemDataHolder(
                              shop_id: snapshot.data![index].shop_name,
                              title: snapshot.data![index].shop_name,
                              imgPath: hhtpGetShopLogoUrl +
                                  snapshot.data![index].shop_id);

                          return ShopItem(shopItemDataHolder: sdh);
                        } catch (e) {}
                      },
                      childCount: counter,
                    ),
                  );
                },
              ),
            ),

            // SliverPadding(
            //   padding: EdgeInsets.only(
            //       left: borderMargin,
            //       right: borderMargin,
            //       top: borderMargin / 2,
            //       bottom: borderMargin / 2),
            //   sliver: SliverGrid(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 5,
            //         childAspectRatio: 1,
            //         mainAxisSpacing: 10.0,
            //         crossAxisSpacing: 10.0),
            //     delegate: SliverChildBuilderDelegate(
            //       (context, index) {
            //         ShopItemDataHolder sdh;
            //         try {
            //           sdh = ShopItemDataHolder(
            //               title: shopitemdataholder[index].title,
            //               imgPath: shopitemdataholder[index].imgPath);
            //         } catch (Exception) {
            //           sdh = ShopItemDataHolder(
            //               title: "No Shop",
            //               imgPath: "images/products/product_1.jpg");
            //         }

            //         return ShopItem(shopItemDataHolder: sdh);
            //       },
            //       childCount: counter,
            //     ),
            //   ),
            // ),

            //Load More Button
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
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(
                                    left: 35, right: 35, top: 25, bottom: 25)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
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

            //Footer
            SliverToBoxAdapter(
              child: FooterPanel(),
            ),
          ],
        ),
      ),
    );
  }

  void _increaseChildCount() {
    setState(() {
      counter += incrementByDropdown;
    });
  }

  Future<List<ShopModel>> fetchShopList() async {
    List<ShopModel> shoplist = <ShopModel>[];
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/shops/select/1/10'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      //print(response.body);
      List<dynamic> values;
      values = jsonDecode(response.body);
      print(values.length.toString());
      print(values.toString());

      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            log(values[i].toString());
            Map<String, dynamic> map = values[i];
            shoplist.add(ShopModel.fromJson(map));
          }
        }
      }
      // Map<String, dynamic> map = jsonDecode(response.body)[0];
      // return ProductModel.fromJson(map);
      return shoplist;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<ShopModel>> fetchSingleShop() async {
    print("Call 1");

    List<ShopModel> shoplist = <ShopModel>[];
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/shops/get/$shopName'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print(response.body);
      // List<dynamic> values;
      // values = jsonDecode(response.body);
      // print(values.length.toString());
      // print(values.toString());

      // if (values.length > 0) {
      //   for (int i = 0; i < values.length; i++) {
      //     if (values[i] != null) {
      //       log(values[i].toString());
      //       try {
      //         Map<String, dynamic> map = values[i];
      //         shoplist.add(ShopModel.fromJson(map));
      //       } catch (e) {}
      //     }
      //   }
      // }
      if (response.body == "Invalid shop name") {
        return shoplist;
      }
      Map<String, dynamic> map = jsonDecode(response.body);
      shoplist.add(ShopModel.fromJson(map));
      //return ProductModel.fromJson(map);
      return shoplist;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
