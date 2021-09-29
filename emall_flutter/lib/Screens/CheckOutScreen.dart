import 'dart:convert';

import 'package:emall_proj/Components/Cart/Cart.dart';
import 'package:emall_proj/Components/Checkout/CheckoutItem.dart';
import 'package:emall_proj/Components/Drawer/Drawer.dart';
import 'package:emall_proj/Components/Footer/Footer.dart';
import 'package:emall_proj/Components/Models/orderModel.dart';
import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Navbar/Navbars.dart';
import 'package:emall_proj/Components/Product/Product.dart';
import 'package:emall_proj/Screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late double subtotal = 0;
  double deliveryCharge = 70;
  double total = 0;

  @override
  void initState() {
    // TODO: implement initState

    orderList = [];
    for (var item in globalproductList) {
      subtotal += item.cartproductData!.price;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController fname = TextEditingController();
    TextEditingController lname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController cell = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController postalcode = TextEditingController();

    final _formKey = GlobalKey<FormState>();

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
              SliverToBoxAdapter(
                child: Container(
                  height: (globalproductList.isEmpty) ? 700 : null,
                  padding: EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: borderMargin,
                                right: 20,
                              ),
                              // color: MyColor.red,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Name';
                                                }
                                                return null;
                                              },
                                              controller: fname,
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                  fillColor: MyColor.White,
                                                  border:
                                                      UnderlineInputBorder(),
                                                  labelText: 'First Name'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Name';
                                                }
                                                return null;
                                              },
                                              controller: lname,
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                  fillColor: MyColor.White,
                                                  border:
                                                      UnderlineInputBorder(),
                                                  labelText: 'Last Name'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Email Address';
                                                }
                                                return null;
                                              },
                                              controller: email,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                  fillColor: MyColor.White,
                                                  border:
                                                      UnderlineInputBorder(),
                                                  labelText: 'Email'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: TextFormField(
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // Only numbers can be entered
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Cell Number';
                                                }
                                                return null;
                                              },
                                              controller: cell,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  fillColor: MyColor.White,
                                                  border:
                                                      UnderlineInputBorder(),
                                                  labelText: 'Mobile Number'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter Address';
                                          }
                                          return null;
                                        },
                                        controller: address,
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        decoration: InputDecoration(
                                            fillColor: MyColor.White,
                                            border: UnderlineInputBorder(),
                                            labelText: 'Address'),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter State';
                                                }
                                                return null;
                                              },
                                              controller: state,
                                              keyboardType: TextInputType.name,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .singleLineFormatter
                                              ], // Only numbers can be entered
                                              decoration: InputDecoration(
                                                  fillColor: MyColor.White,
                                                  border:
                                                      UnderlineInputBorder(),
                                                  labelText: 'State'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Postal Code';
                                                }
                                                return null;
                                              },
                                              controller: postalcode,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // Only numbers can be entered
                                              decoration: InputDecoration(
                                                  fillColor: MyColor.White,
                                                  border:
                                                      UnderlineInputBorder(),
                                                  labelText: 'Postal Code'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20,
                                      right: borderMargin,
                                      top: 50,
                                      bottom: 50),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Your Shopping Bag",
                                        style: GoogleFonts.poppins(
                                            color: MyColor.Black,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: borderMargin),
                                  child: Row(
                                    children: [
                                      //Avatar
                                      Expanded(
                                          child: Text(
                                        "Image",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),

                                      Text(
                                        "Title & Code",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      //Product Color
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Color",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Product Size
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Size",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Product Price
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Quantity",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Product Price
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Price",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: borderMargin,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        (globalproductList.isEmpty)
                                            ? MainAxisAlignment.center
                                            : MainAxisAlignment.start,
                                    children: [
                                      (globalproductList.isEmpty)
                                          ? Center(
                                              child: Text(
                                                "Your Cart Is Empty.",
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          : Container(
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    globalproductList.length,
                                                itemBuilder: (context, index) {
                                                  return CheckoutItem(
                                                    product: Product(
                                                      cartproductData:
                                                          globalproductList[
                                                                  index]
                                                              .cartproductData,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                      (globalproductList.isEmpty)
                                          ? SizedBox(height: 10)
                                          : Container(),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: borderMargin,
                                      right: borderMargin,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "Sub Total:",
                                                style: GoogleFonts.poppins(
                                                  color: MyColor.Black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                subtotal.toString(),
                                                style: GoogleFonts.poppins(
                                                  color: MyColor.Black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: borderMargin,
                                      right: borderMargin,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "Delivery Charge:",
                                                style: GoogleFonts.poppins(
                                                  color: MyColor.Black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                deliveryCharge.toString(),
                                                style: GoogleFonts.poppins(
                                                  color: MyColor.Black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: borderMargin,
                                      right: borderMargin,
                                      top: 10,
                                      bottom: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(child: Container()),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "Total:",
                                                style: GoogleFonts.poppins(
                                                  color: MyColor.Black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                (subtotal + deliveryCharge)
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                  color: MyColor.Black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (globalproductList.isEmpty)
                        Container()
                      else
                        Container(
                          margin: EdgeInsets.only(
                              left: borderMargin, right: borderMargin, top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //View All button
                              ElevatedButton(
                                child: Text(
                                  "Continue Shopping",
                                  style: GoogleFonts.poppins(
                                      color: MyColor.Black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      MyColor.White.withOpacity(0)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
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
                                      borderRadius: BorderRadius.circular(
                                          buttonBorderRadius),
                                      side: BorderSide(
                                          color: MyColor.lightGreyBorder,
                                          width: 1.5),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                },
                              ),
                              //Checkout button
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.

                                    fillorderList(address, state, email)
                                        .whenComplete(() => orderProducts());
                                  }
                                },
                                child: Text(
                                  "Checkout",
                                  style: GoogleFonts.poppins(
                                    color: MyColor.Black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all<Color>(
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
                                      borderRadius: BorderRadius.circular(
                                          buttonBorderRadius),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: FooterPanel())
            ],
          ),
        ),
      ),
    );
  }

  Future orderProducts() async {
    var body = jsonEncode(orderList);
    print("Body: ${body}");
    var url = Uri.parse('http://127.0.0.1:8000/api/post_orders');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    print('Response status: ${response.statusCode}');

    // final response = await http.post(
    //   "http://127.0.0.1:8000/api/post_orders",
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(orderList),
    // );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print('Response body: ${response.body}');
      Map<String, dynamic> _body = jsonDecode(response.body);
      String status = _body['status'];
      print('Response body:' + status);

      if (status == "success") {
        showDialog(
          context: context,
          builder: (builder) {
            return AlertDialog(title: Text("Order Placed Successfully."));
          },
        );
        orderList = [];
        globalproductList = [];
        await Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
      } else {
        showDialog(
          context: context,
          builder: (builder) {
            return AlertDialog(title: Text("Failed To Place Order"));
          },
        );
      }

      //return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print('Failed to create album.');
    }
  }

  Future fillorderList(TextEditingController address,
      TextEditingController state, TextEditingController email) async {
    orderList.clear();
    await Future.forEach<Product>(
        globalproductList,
        (item) => orderList.add(
              orderModel(
                  product_id: item.cartproductData!.product_id,
                  shop_id: item.cartproductData!.shop_id,
                  total: (item.cartproductData!.price *
                          item.cartproductData!.quantity)
                      .toString(),
                  order_address: address.text,
                  state: state.text,
                  user_email: email.text),
            ));
  }
}
