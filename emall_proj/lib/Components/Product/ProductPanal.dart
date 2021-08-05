import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:emall_proj/Components/Product/ProductViewPanel.dart';
import 'package:emall_proj/Components/RadioButtons/MyRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class ProductPanal extends StatefulWidget {
  const ProductPanal({Key? key}) : super(key: key);

  @override
  _ProductPanalState createState() => _ProductPanalState();
}

class _ProductPanalState extends State<ProductPanal> {
  List<RadioModel> sampleData = [
    RadioModel(false, 'A', 'April 18'),
    RadioModel(false, 'B', 'April 17'),
    RadioModel(false, 'C', 'April 16'),
    RadioModel(false, 'D', 'April 15')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Builder(
        builder: (context) => CustomScrollView(
          slivers: <Widget>[
            //Navbar

            SliverToBoxAdapter(
              child: NavBar(drawerCallback: () {
                setState(() {
                  Scaffold.of(context).openDrawer();
                });
              }),
            ),

            //Information Row
            SliverToBoxAdapter(
              child: Container(
                margin:
                    EdgeInsets.only(left: borderMargin, right: borderMargin),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      //color: Colors.blue,
                      height: 100,
                    )),
                    Expanded(
                        child: Container(
                      //color: Colors.blue,
                      height: 100,
                      child: Row(
                        //First Part Of Express Delivery Text and icon
                        children: [
                          Expanded(
                              child: Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Icons
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(left: 30),
                                          height: 100,
                                          //color: Colors.red,
                                          child: Icon(
                                            Icons.delivery_dining,
                                            size: 36,
                                          ))),

                                  //Two Colums of Text
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        //color: Colors.red,
                                        height: 100,
                                        child: Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Standard shipment ",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "Free within 3-6 business days",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )),

                          //Second Part Of Express Delivery Text and icon

                          Expanded(
                              child: Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Icons
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(left: 30),
                                          height: 100,
                                          //color: Colors.red,
                                          child: Icon(
                                            Icons.money,
                                            size: 36,
                                          ))),

                                  //Two Colums of Text
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        //color: Colors.red,
                                        height: 100,
                                        child: Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Express delivery",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "\$35,00 available",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),

            //Product Row
            SliverToBoxAdapter(
              child: Container(
                height: 600,
                margin:
                    EdgeInsets.only(left: borderMargin, right: borderMargin),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      //color: Colors.red,
                      child: Row(
                        children: [
                          //List of small images
                          Container(
                              //color: Colors.blue,
                              width: 200,
                              margin: EdgeInsets.all(10),
                              child: ListView(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    margin: EdgeInsets.only(bottom: 10),
                                    color: Colors.yellow,
                                    child: InkWell(
                                      child: Image(
                                        image: AssetImage(
                                            "images/products/product_1.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 150,
                                    margin: EdgeInsets.only(bottom: 10),
                                    color: Colors.yellow,
                                    child: InkWell(
                                      child: Image(
                                        image: AssetImage(
                                            "images/products/product_1.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 150,
                                    margin: EdgeInsets.only(bottom: 10),
                                    color: Colors.yellow,
                                    child: InkWell(
                                      child: Image(
                                        image: AssetImage(
                                            "images/products/product_1.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              )),

                          //Main Image
                          Expanded(
                              child: Container(
                            //color: Colors.yellow,
                            padding: EdgeInsets.all(10),
                            child: Image(
                              image:
                                  AssetImage("images/products/product_1.jpg"),
                              fit: BoxFit.fitWidth,
                            ),
                          ))
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "T-Shirt Summer Vibes",
                            style: GoogleFonts.poppins(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "\$149.99",
                                style: GoogleFonts.poppins(
                                    color: MyColor.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "\$200",
                                style: GoogleFonts.poppins(
                                    color: MyColor.lightGreyBorder,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 150,
                          ),
                          Flexible(
                            child: Container(
                              color: Colors.red,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: sampleData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return new InkWell(
                                          //highlightColor: Colors.red,
                                          splashColor: Colors.blueAccent,
                                          onTap: () {
                                            setState(() {
                                              sampleData.forEach((element) =>
                                                  element.isSelected = false);
                                              sampleData[index].isSelected =
                                                  true;
                                            });
                                          },
                                          child:
                                              new RadioItem(sampleData[index]),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),

            //Description And Reviews Buttons
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.only(
                    top: 50,
                    bottom: 50,
                    left: borderMargin,
                    right: borderMargin),
                child: Row(
                  children: [],
                ),
              ),
            ),

            //Description And Reviews panels
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                margin:
                    EdgeInsets.only(left: borderMargin, right: borderMargin),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.red,
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.red,
                    ))
                  ],
                ),
              ),
            ),

//
            // Product View Panel
//
            // SliverToBoxAdapter(
            //   child: ProductViewPanel(),
            // ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
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
}
