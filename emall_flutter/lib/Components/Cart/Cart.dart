import 'dart:developer';
import 'package:emall_proj/Components/CallBacks/Callbacks.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Product/Product.dart';
import 'package:emall_proj/Screens/CheckOutScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../MyColors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(cardBorderRadius),
        ),
      ),
      width: 850,
      height: (globalproductList.isEmpty) ? 100 : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (globalproductList.isEmpty)
              ? Center(
                  child: Text(
                    "Your Cart Is Empty.",
                    textAlign: TextAlign.center,
                  ),
                )
              : Container(
                  height: (globalproductList.length > 4) ? 500 : null,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: globalproductList.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        product: Product(
                          cartproductData:
                              globalproductList[index].cartproductData,
                        ),
                        deleteCallBack: () {
                          setState(() {
                            globalproductList.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
          (globalproductList.isEmpty) ? SizedBox(height: 10) : Container(),
          (globalproductList.isEmpty)
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // //View All button
                    // ElevatedButton(
                    //   child: Text(
                    //     "View All",
                    //     style: GoogleFonts.poppins(
                    //         color: MyColor.Black,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    //   style: ButtonStyle(
                    //     shadowColor: MaterialStateProperty.all<Color>(
                    //         MyColor.White.withOpacity(0)),
                    //     backgroundColor:
                    //         MaterialStateProperty.all<Color>(Colors.white),
                    //     padding: MaterialStateProperty.all<EdgeInsets>(
                    //         EdgeInsets.only(
                    //             left: 35, right: 35, top: 25, bottom: 25)),
                    //     shape:
                    //         MaterialStateProperty.all<RoundedRectangleBorder>(
                    //       RoundedRectangleBorder(
                    //         borderRadius:
                    //             BorderRadius.circular(buttonBorderRadius),
                    //         side: BorderSide(
                    //             color: MyColor.lightGreyBorder, width: 1.5),
                    //       ),
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    // ),
                    //Checkout button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOutScreen()));
                      },
                      child: Text(
                        "Go To Checkout",
                        style: GoogleFonts.poppins(
                          color: MyColor.Black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all<Color>(
                            MyColor.White.withOpacity(0)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(MyColor.orange),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.only(
                                left: 35, right: 35, top: 25, bottom: 25)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(buttonBorderRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Product product;
  CartDeleteCallBack deleteCallBack;
  CartItem({
    required this.product,
    required this.deleteCallBack,
    Key? key,
  }) : super(key: key);
  final mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            //Avatar
            Expanded(
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(product.cartproductData!.imagePath),
              ),
            ),

            //Product Name and Code
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.cartproductData!.title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "#Code",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            //Product Color
            Expanded(
              child: Center(
                child: Text(
                  "White",
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
                  "XL",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            //Product Amount
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       //Quantity input Field
            //       Container(
            //         width: 80,
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //               width: 1.5, color: MyColor.lightGreyBorder),
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(40),
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             //Subtract button

            //             Flexible(
            //               child: Container(
            //                 //color: Colors.red,
            //                 child: IconButton(
            //                   splashRadius: 15,
            //                   hoverColor: Colors.transparent,
            //                   splashColor: Colors.transparent,
            //                   icon: Icon(
            //                     Icons.add,
            //                     color: MyColor.Black,
            //                   ),
            //                   iconSize: 14,
            //                   onPressed: () {
            //                     log("Minus");
            //                     incrementProductQuantity();
            //                   },
            //                 ),
            //               ),
            //             ), Flexible(
            //               child: Container(
            //                 //color: Colors.red,
            //                 child: IconButton(
            //                   splashRadius: 15,
            //                   hoverColor: Colors.transparent,
            //                   splashColor: Colors.transparent,
            //                   icon: Icon(
            //                     Icons.add,
            //                     color: MyColor.Black,
            //                   ),
            //                   iconSize: 14,
            //                   onPressed: () {
            //                     log("Minus");
            //                     incrementProductQuantity();
            //                   },
            //                 ),
            //               ),
            //             ),

            //             //Input Field

            //             Expanded(
            //               child: Container(
            //                 //color: Colors.yellow,
            //                 child: Center(
            //                   child: TextField(
            //                     controller: mycontroller,
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontSize: 15.0,
            //                     ),
            //                     keyboardType: TextInputType.number,
            //                     decoration: InputDecoration(
            //                       border: InputBorder.none,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),

            //             //Add Button

            //             Flexible(
            //               child: Container(
            //                 //color: Colors.red,
            //                 child: IconButton(
            //                   alignment: Alignment.centerLeft,
            //                   splashRadius: 15,
            //                   hoverColor: Colors.transparent,
            //                   splashColor: Colors.transparent,
            //                   icon: Icon(
            //                     Icons.add,
            //                     color: MyColor.Black,
            //                   ),
            //                   iconSize: 14,
            //                   onPressed: () {
            //                     incrementProductQuantity();
            //                   },
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            //Product Price
            Expanded(
              child: Center(
                child: Text(
                  product.cartproductData!.quantity.toString(),
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
                  product.cartproductData!.price.toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            //Delete Button
            Expanded(
              child: Center(
                child: IconButton(
                  onPressed: () {
                    deleteCallBack();
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void incrementProductQuantity() {
    // if (productQuantity < 99) {
    //   setState(() {
    //     if (int.parse(mycontroller.text) == productQuantity) {
    //       productQuantity++;
    //       setTextcontrollerText(productQuantity);
    //     } else {
    //       productQuantity = int.parse(mycontroller.text) + 1;
    //       setTextcontrollerText(productQuantity);
    //     }
    //   });
    // }
  }
}
