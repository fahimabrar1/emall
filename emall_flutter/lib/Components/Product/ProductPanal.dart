import 'dart:convert';
import 'dart:developer';
import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/Models/productModel.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:emall_proj/Components/Product/Product.dart';
import 'package:emall_proj/Components/RadioButtons/MyRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
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

// ignore: must_be_immutable
class ProductPanal extends StatefulWidget {
  String productId;
  ProductPanal({required this.productId, Key? key}) : super(key: key);

  @override
  _ProductPanalState createState() => _ProductPanalState(productId);
}

class _ProductPanalState extends State<ProductPanal> {
  String? productId;
  _ProductPanalState(this.productId);
  List<RadioModel> sampleData = [
    RadioModel(false, Colors.blueAccent),
    RadioModel(false, Colors.green),
    RadioModel(false, Colors.deepPurple),
    RadioModel(false, Colors.pinkAccent),
  ];

  int productQuantity = 1;
  final mycontroller = TextEditingController();

  late Future<ProductModel> productModel;
  final String imageUrl = "http://127.0.0.1:8000/api/images/";
  int selectedImage = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productModel = fetchProduct();
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
                  child: FutureBuilder<ProductModel>(
                    future: productModel,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
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
                                        (!snapshot.data!.image1.isEmpty)
                                            ? Container(
                                                width: 150,
                                                height: 150,
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                //color: Colors.yellow,
                                                child: InkWell(
                                                  child: Image.network(
                                                    imageUrl +
                                                        snapshot
                                                            .data!.product_id +
                                                        "/1",
                                                    fit: BoxFit.fitWidth,
                                                    errorBuilder:
                                                        (context, o, s) {
                                                      return Image.asset(
                                                          "assets/images/products/product_1.jpg");
                                                    },
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedImage = 1;
                                                    });
                                                  },
                                                ),
                                              )
                                            : Container(),
                                        (!snapshot.data!.image2.isEmpty)
                                            ? Container(
                                                width: 150,
                                                height: 150,
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                //color: Colors.yellow,
                                                child: InkWell(
                                                  child: Image.network(
                                                    imageUrl +
                                                        snapshot
                                                            .data!.product_id +
                                                        "/1",
                                                    fit: BoxFit.fitWidth,
                                                    errorBuilder:
                                                        (context, o, s) {
                                                      return Image.asset(
                                                          "assets/images/products/product_1.jpg");
                                                    },
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedImage = 2;
                                                    });
                                                  },
                                                ),
                                              )
                                            : Container(),
                                        (!snapshot.data!.image3.isEmpty)
                                            ? Container(
                                                width: 150,
                                                height: 150,
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                //color: Colors.yellow,
                                                child: InkWell(
                                                  child: Image.network(
                                                    imageUrl +
                                                        snapshot
                                                            .data!.product_id +
                                                        "/2",
                                                    fit: BoxFit.fitWidth,
                                                    errorBuilder:
                                                        (context, o, s) {
                                                      return Image.asset(
                                                          "assets/images/products/product_1.jpg");
                                                    },
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedImage = 3;
                                                    });
                                                  },
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),

                                  //Main Image
                                  Expanded(
                                    child: Container(
                                      //color: Colors.red,
                                      foregroundDecoration: BoxDecoration(
                                        image: DecorationImage(
                                          alignment: Alignment.topCenter,
                                          image: NetworkImage(
                                            imageUrl +
                                                snapshot.data!.product_id +
                                                "/" +
                                                selectedImage.toString(),
                                          ),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      //color: Colors.yellow,
                                      padding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ],
                              ),
                            )),

                            //Product Details Panel

                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 20),
                                //color: Colors.blue,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Product Title

                                    Text(
                                      //"T-Shirt Summer Vibes",
                                      snapshot.data!.name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    //Product price Tag

                                    Row(
                                      children: [
                                        //On Sale
                                        (snapshot.data!.discount > 0)
                                            ? Text(
                                                //"\$149.99",
                                                "\$" +
                                                    snapshot.data!.discount
                                                        .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: MyColor.red,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            : Container(
                                                height: 0,
                                                width: 0,
                                              ),

                                        //Gap of 20

                                        (snapshot.data!.discount > 0)
                                            ? SizedBox(width: 20)
                                            : Container(),

                                        //Main Price

                                        (snapshot.data!.discount > 0)
                                            ? Text(
                                                //"\$200",
                                                "\$" +
                                                    snapshot.data!.price
                                                        .toString(),

                                                style: GoogleFonts.poppins(
                                                  color:
                                                      MyColor.lightGreyBorder,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w400,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              )
                                            : Text(
                                                //"\$200",
                                                "\$" +
                                                    snapshot.data!.price
                                                        .toString(),

                                                style: GoogleFonts.poppins(
                                                  color: MyColor.Black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w400,
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),

                                    //Color Radio Button Container
                                    Container(
                                      height: 60,
                                      //color: Colors.red,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: sampleData.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return new InkWell(
                                            //highlightColor: Colors.red,
                                            splashColor: sampleData[index]
                                                .color
                                                .withOpacity(0.2),
                                            onTap: () {
                                              setState(() {
                                                sampleData.forEach((element) =>
                                                    element.isSelected = false);
                                                sampleData[index].isSelected =
                                                    true;
                                              });
                                            },
                                            child: new RadioItem(
                                                sampleData[index]),
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
                                        shadowColor:
                                            MaterialStateProperty.all<Color>(
                                                MyColor.White.withOpacity(0)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        padding: MaterialStateProperty
                                            .all<EdgeInsets>(EdgeInsets.only(
                                                left: 25,
                                                right: 25,
                                                top: 15,
                                                bottom: 15)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),

                                    //Gap of 10

                                    SizedBox(
                                      height: 10,
                                    ),

                                    //Quantity Fields And Buttons

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //Subtract button

                                              Flexible(
                                                child: Container(
                                                  //color: Colors.red,
                                                  child: IconButton(
                                                    splashRadius: 15,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: MyColor.Black,
                                                    ),
                                                    iconSize: 16,
                                                    onPressed: () {
                                                      //log("Minus");
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
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
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
                                                    hoverColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
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
                                          onPressed: () {
                                            setState(() {
                                              int initialprice =
                                                  (snapshot.data!.discount > 0)
                                                      ? snapshot.data!.discount
                                                      : snapshot.data!.price;
                                              double quantity = double.parse(
                                                  mycontroller.text);

                                              globalproductList.add(Product(
                                                cartproductData:
                                                    CartProductDataHolder(
                                                        product_id: snapshot
                                                            .data!.product_id,
                                                        shop_id: snapshot
                                                            .data!.shop_id_fk,
                                                        title:
                                                            snapshot.data!.name,
                                                        price: initialprice *
                                                            quantity,
                                                        imagePath: imageUrl +
                                                            snapshot.data!
                                                                .product_id +
                                                            "/1",
                                                        boxfit: BoxFit.fill,
                                                        quantity: int.parse(
                                                            mycontroller.text)),
                                              ));
                                            });
                                          },
                                          child: Text(
                                            "Add To Cart",
                                            style: GoogleFonts.poppins(
                                              color: MyColor.Black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            shadowColor: MaterialStateProperty
                                                .all<Color>(
                                                    MyColor.White.withOpacity(
                                                        0)),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(MyColor.orange),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
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
                              ),
                            )
                          ],
                        );
                      } else {
                        return Center(child: LinearProgressIndicator());
                      }
                    },
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

  Future<ProductModel> fetchProduct() async {
    final response = await http.get(Uri.parse(
        'http://127.0.0.1:8000/api/products/select/$productId/$productId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log("Body : " + response.body);
      Map<String, dynamic> map = jsonDecode(response.body)[0];
      return ProductModel.fromJson(map);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
