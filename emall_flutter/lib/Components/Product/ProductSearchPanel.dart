import 'dart:convert';
import 'dart:developer';

import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/EnumHolders.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/Models/productModel.dart';
import 'package:emall_proj/Components/Navbar/NavBarIcons.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../MyColors.dart';
import '../MyGlobalVariables.dart';
import 'Product.dart';

class ProductSearchPanel extends StatefulWidget {
  String? shopName;
  ProductSearchPanel(this.shopName, {Key? key}) : super(key: key);

  @override
  _ProductSearchPanelState createState() => _ProductSearchPanelState(shopName);
}

class _ProductSearchPanelState extends State<ProductSearchPanel> {
  List<ProductDataHolder> productitemdataholder = [
    ProductDataHolder(
        product_id: "1",
        title: 'T-Shirt Summer Vibes',
        price: 120,
        discount: 120,
        imagePath: 'assets/images/products/product_1.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        product_id: "1",
        title: 'Loose Knit 3/4 Sleeve',
        price: 150,
        discount: 120,
        imagePath: 'assets/images/products/product_2.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        product_id: "1",
        title: 'Basic Slim Fit T-Shirt',
        price: 799.99,
        discount: 120,
        imagePath: 'assets/images/products/product_3.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        product_id: "1",
        title: 'T-Shirt Summer Vibes',
        price: 120,
        discount: 120,
        imagePath: 'assets/images/products/product_4.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        product_id: "1",
        title: 'Loose Textured T-Shirt',
        price: 1150,
        discount: 120,
        imagePath: 'assets/images/products/product_5.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        product_id: "1",
        title: 'T-Shirt Summer Vibes',
        price: 120,
        discount: 120,
        imagePath: 'assets/images/products/product_1.jpg',
        boxfit: BoxFit.fitWidth),
  ];
  List<String> dropDownMenu = ["10", "20", "30"];
  String dropdownValue = "10";

  int counter = 10;
  int incrementByDropdown = 10;
  late Future<List<ProductModel>> productModelList;
  String? shopName;
  _ProductSearchPanelState(this.shopName);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    productModelList = fetchProductList();
  }

  TextEditingController myProductSearchControllerText = TextEditingController();
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
                                  controller: myProductSearchControllerText,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search..."),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                log("Search : " +
                                    myProductSearchControllerText.text);
                                setState(() {
                                  shopName = myProductSearchControllerText.text;
                                  productModelList = fetchProductList();
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

            //Search Grid Title And Option In Sliver
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
                              "All Products: ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: MyColor.Black),
                            ),
                            // Text(
                            //   "(130)",
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
                              "Show Products: ",
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
            SliverPadding(
              padding: EdgeInsets.only(
                  left: borderMargin,
                  right: borderMargin,
                  top: borderMargin / 2,
                  bottom: borderMargin / 2),
              sliver: FutureBuilder<List<ProductModel>>(
                future: productModelList,
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
                        childAspectRatio: 0.5,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        ProductDataHolder pdh;
                        try {
                          // pdh = ProductDataHolder(
                          //     product_id:
                          //         productitemdataholder[index].product_id,
                          //     title: productitemdataholder[index].title,
                          //     price: productitemdataholder[index].price,
                          //     imagePath: productitemdataholder[index].imagePath,
                          //     boxfit: productitemdataholder[index].boxfit);
                          pdh = ProductDataHolder(
                              product_id: snapshot.data![index].product_id,
                              title: snapshot.data![index].name,
                              price: snapshot.data![index].price.toDouble(),
                              discount:
                                  snapshot.data![index].discount.toDouble(),
                              imagePath: hhtpGetProductImageUrl +
                                  snapshot.data![index].product_id +
                                  "/1",
                              boxfit: BoxFit.fitHeight);
                          return Product(productData: pdh);
                        } catch (Exception) {
                          //No More Products
                        }
                      },
                      childCount: counter,
                    ),
                  );
                },
              ),
            ),

            //Load More Button
            SliverToBoxAdapter(
              child: (counter == productitemdataholder.length)
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
      if (productitemdataholder.length > counter) {
        counter += incrementByDropdown;
      }
    });
  }

  Future<List<ProductModel>> fetchProductList() async {
    List<ProductModel> productlist = <ProductModel>[];
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/shops/products/$shopName'));

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
            productlist.add(ProductModel.fromJson(map));
          }
        }
      }
      // Map<String, dynamic> map = jsonDecode(response.body)[0];
      // return ProductModel.fromJson(map);
      return productlist;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
