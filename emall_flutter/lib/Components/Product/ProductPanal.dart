import 'dart:developer';
import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:emall_proj/Components/RadioButtons/MyRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';
import 'ProductViewPanel.dart';

///
///
/// Product Panel Vis the Product Page.
/// It shows all the details of a product.
/// Gives us flexibility to retrive information from database and use the informations retrived in the page
/// So Users can add it to their cart.
///
///

class ProductPanal extends StatefulWidget {
  const ProductPanal({Key? key}) : super(key: key);

  @override
  _ProductPanalState createState() => _ProductPanalState();
}

class _ProductPanalState extends State<ProductPanal> {
  List<RadioModel> sampleData = [
    RadioModel(false, Colors.blueAccent),
    RadioModel(false, Colors.green),
    RadioModel(false, Colors.deepPurple),
    RadioModel(false, Colors.pinkAccent),
  ];

  int productQuantity = 1;
  final mycontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mycontroller.text = productQuantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Builder(
        builder: (context) => SafeArea(
          child: CustomScrollView(
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

              // Product Row
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
                                            "assets/images/products/product_1.jpg"),
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
                                            "assets/images/products/product_1.jpg"),
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
                                            "assets/images/products/product_1.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Main Image
                            Expanded(
                                child: Container(
                              //color: Colors.yellow,
                              padding: EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(
                                    "assets/images/products/product_1.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                            ))
                          ],
                        ),
                      )),

                      //Product Details Panel

                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(10),
                        //color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Product Title

                            Text(
                              "T-Shirt Summer Vibes",
                              style: GoogleFonts.poppins(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),

                            //Product price Tag

                            Row(
                              children: [
                                //On Sale

                                Text(
                                  "\$149.99",
                                  style: GoogleFonts.poppins(
                                      color: MyColor.red,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),

                                //Gap of 20

                                SizedBox(width: 20),

                                //Main Price

                                Text(
                                  "\$200",
                                  style: GoogleFonts.poppins(
                                    color: MyColor.lightGreyBorder,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),

                            //Gap of 50

                            SizedBox(
                              height: 50,
                            ),

                            //Text Color

                            Text(
                              "Colors :",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),

                            //Color Radio Button Container

                            Container(
                              height: 60,
                              //color: Colors.red,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sampleData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return new InkWell(
                                    //highlightColor: Colors.red,
                                    splashColor: sampleData[index]
                                        .color
                                        .withOpacity(0.2),
                                    onTap: () {
                                      setState(() {
                                        sampleData.forEach((element) =>
                                            element.isSelected = false);
                                        sampleData[index].isSelected = true;
                                      });
                                    },
                                    child: new RadioItem(sampleData[index]),
                                  );
                                },
                              ),
                            ),

                            //Gap of 50

                            SizedBox(
                              height: 50,
                            ),

                            //Quantity Text And Selct size Text
                            Row(
                              children: [
                                //Text Size
                                Text(
                                  "Size :",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),

                                //Gap of 50
                                SizedBox(
                                  width: 50,
                                ),

                                //Text Select Sizes
                                Text(
                                  "Select the sizes",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),

                            //Gap of 10

                            SizedBox(
                              height: 10,
                            ),

                            //Size button
                            // TODO: Have to implement AlertDialogue

                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Choose Size",
                                style: GoogleFonts.poppins(
                                    color: MyColor.lightGreyBorder),
                              ),
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(
                                    MyColor.White.withOpacity(0)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 15,
                                        bottom: 15)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: MyColor.lightGreyBorder,
                                        width: 1.5),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 50,
                            ),

                            //Text Quantity
                            Text(
                              "Quantity: ",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),

                            //Gap of 10

                            SizedBox(
                              height: 10,
                            ),

                            //Quantity Fields And Buttons

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Quantity input Field
                                Container(
                                  width: 100,
                                  padding: EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5,
                                        color: MyColor.lightGreyBorder),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Subtract button

                                      Flexible(
                                        child: Container(
                                          //color: Colors.red,
                                          child: IconButton(
                                            splashRadius: 15,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            icon: Icon(
                                              Icons.add,
                                              color: MyColor.Black,
                                            ),
                                            iconSize: 16,
                                            onPressed: () {
                                              log("Minus");
                                              decrementProductQuantity();
                                            },
                                          ),
                                        ),
                                      ),

                                      //Input Field

                                      Expanded(
                                        child: Container(
                                          //color: Colors.yellow,
                                          child: Center(
                                            child: TextField(
                                              controller: mycontroller,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Add Button

                                      Flexible(
                                        child: Container(
                                          //color: Colors.red,
                                          child: IconButton(
                                            splashRadius: 15,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            icon: Icon(
                                              Icons.add,
                                              color: MyColor.Black,
                                            ),
                                            iconSize: 16,
                                            onPressed: () {
                                              incrementProductQuantity();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //Gap of 25

                                SizedBox(
                                  width: 25,
                                ),

                                //Add to Cart
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Add To Cart",
                                    style: GoogleFonts.poppins(
                                      color: MyColor.Black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                            MyColor.White.withOpacity(0)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyColor.orange),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.only(
                                                left: 35,
                                                right: 35,
                                                top: 25,
                                                bottom: 25)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                  color: MyColor.lightOrange,
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 50,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Description",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Description And Reviews panels
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      EdgeInsets.only(left: borderMargin, right: borderMargin),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          //color: Colors.red,
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      // Expanded(
                      //     child: Container(
                      //   color: Colors.red,
                      // ),)
                    ],
                  ),
                ),
              ),

              //
              // Product View Panel
              //
              SliverToBoxAdapter(
                child: ProductViewPanel(),
              ),
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
      ),
    );
  }

  ///
  ///
  ///  Increments the product quantity by 1 there is a range too
  ///
  void incrementProductQuantity() {
    if (productQuantity < 99) {
      setState(() {
        if (int.parse(mycontroller.text) == productQuantity) {
          productQuantity++;
          setTextcontrollerText(productQuantity);
        } else {
          productQuantity = int.parse(mycontroller.text) + 1;
          setTextcontrollerText(productQuantity);
        }
      });
    }
  }

  ///
  ///
  /// Decrements the product quantity by 1 there is a range too
  ///
  void decrementProductQuantity() {
    if (productQuantity > 1) {
      setState(() {
        if (int.parse(mycontroller.text) == productQuantity) {
          productQuantity--;
          setTextcontrollerText(productQuantity);
        } else {
          productQuantity = int.parse(mycontroller.text) - 1;
          setTextcontrollerText(productQuantity);
        }
      });
    }
  }

  ///
  ///
  /// Sets Product Quanity To the text quantity field
  ///
  void setTextcontrollerText(int productQuantity) {
    mycontroller.text = productQuantity.toString();
  }
}
