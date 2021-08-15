import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/Navbar/NavBarIcons.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';
import '../MyGlobalVariables.dart';
import 'Product.dart';

class ProductSearchPanel extends StatefulWidget {
  const ProductSearchPanel({Key? key}) : super(key: key);

  @override
  _ProductSearchPanelState createState() => _ProductSearchPanelState();
}

class _ProductSearchPanelState extends State<ProductSearchPanel> {
  List<ProductDataHolder> productitemdataholder = [
    ProductDataHolder(
        title: 'T-Shirt Summer Vibes',
        price: 120,
        imagePath: 'assets/images/products/product_1.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        title: 'Loose Knit 3/4 Sleeve',
        price: 150,
        imagePath: 'assets/images/products/product_2.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        title: 'Basic Slim Fit T-Shirt',
        price: 799.99,
        imagePath: 'assets/images/products/product_3.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        title: 'T-Shirt Summer Vibes',
        price: 120,
        imagePath: 'assets/images/products/product_4.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        title: 'Loose Textured T-Shirt',
        price: 1150,
        imagePath: 'assets/images/products/product_5.jpg',
        boxfit: BoxFit.fitWidth),
    ProductDataHolder(
        title: 'T-Shirt Summer Vibes',
        price: 120,
        imagePath: 'assets/images/products/product_1.jpg',
        boxfit: BoxFit.fitWidth),
  ];
  List<String> dropDownMenu = ["10", "20", "30"];
  String dropdownValue = "10";

  int counter = 10;
  int incrementByDropdown = 10;

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
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search..."),
                                ),
                              ),
                            ),
                            NavBarIcon(Icons.search, MyColor.orange),
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
                            Text(
                              "(130)",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 18,
                                  color: MyColor.lightGreyBorder),
                            ),
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
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: (productWidth / productHeight) - 0.1,
                    mainAxisSpacing: panelElementGaps,
                    crossAxisSpacing: panelElementGaps),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    ProductDataHolder pdh;
                    try {
                      pdh = ProductDataHolder(
                          title: productitemdataholder[index].title,
                          price: productitemdataholder[index].price,
                          imagePath: productitemdataholder[index].imagePath,
                          boxfit: productitemdataholder[index].boxfit);
                      return Product(product: pdh);
                    } catch (Exception) {
                      //No More Products
                    }
                  },
                  childCount: counter,
                ),
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
}
