import 'dart:convert';
import 'dart:developer';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:http/http.dart' as http;
import 'package:emall_proj/Components/Models/productModel.dart';
import 'package:emall_proj/Components/Product/ProductPanal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../MyColors.dart';

class CartProductDataHolder {
  String product_id;
  String shop_id;
  String title;
  String imagePath;
  BoxFit boxfit;
  double price;
  int quantity;
  String? size;
  String? color;

  CartProductDataHolder(
      {required this.product_id,
      required this.shop_id,
      required this.title,
      required this.price,
      required this.imagePath,
      required this.boxfit,
      required this.quantity,
      this.size,
      this.color});
}

class ProductDataHolder {
  String product_id;
  String title;
  String imagePath;
  BoxFit boxfit;
  double price;
  double discount;

  ProductDataHolder({
    required this.product_id,
    required this.title,
    required this.price,
    required this.discount,
    required this.imagePath,
    required this.boxfit,
  });
}

class Product extends StatefulWidget {
  ProductDataHolder? productData;
  CartProductDataHolder? cartproductData;
  Product({this.productData, this.cartproductData, Key? key}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: productWidth,
      height: productHeight,
      //color: Colors.yellow.withOpacity(0.4),
      child: InkWell(
        onTap: () {
          String id;
          if (widget.productData != null) {
            id = widget.productData!.product_id;
          } else {
            id = widget.cartproductData!.product_id;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPanal(productId: id),
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  Container(
                    //  child: Image(
                    // image: AssetImage("assets/images/products/product_1.jpg"),
                    // fit: BoxFit.fitWidth,
                    // image: (widget.productData != null)
                    //     ? NetworkImage(widget.productData!.imagePath)
                    //     : NetworkImage(widget.cartproductData!.imagePath),
                    // fit: (widget.productData != null)
                    //     ? widget.productData!.boxfit
                    //     : widget.cartproductData!.boxfit,
                    // alignment: Alignment.center,
                    //  child: Image(

                    // fit: BoxFit.fill,
                    // alignment: Alignment.center,
                    //),
                    foregroundDecoration: BoxDecoration(
                        image: DecorationImage(
                      image: (widget.productData != null)
                          ? NetworkImage(widget.productData!.imagePath)
                          : NetworkImage(widget.cartproductData!.imagePath),
                      fit: (widget.productData != null)
                          ? widget.productData!.boxfit
                          : widget.cartproductData!.boxfit,
                    )),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                  (widget.productData!.discount > 0)
                      ? Container(
                          height: 20,
                          width: 50,
                          margin: EdgeInsets.only(top: 20, left: 20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(cardBorderRadius),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "SALE",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w800,
                                color: MyColor.White,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.green.withOpacity(0.2),
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productData!.title,
                            style: GoogleFonts.poppins(
                                color: MyColor.Black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Row(
                            children: [
                              (widget.productData!.discount > 0)
                                  ? Text(
                                      widget.productData!.discount.toString() +
                                          "Tk",
                                      style: GoogleFonts.poppins(
                                        color: MyColor.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    )
                                  : Container(),
                              (widget.productData!.discount > 0)
                                  ? SizedBox(
                                      width: 20,
                                    )
                                  : Container(),
                              (widget.productData!.discount > 0)
                                  ? Text(
                                      widget.productData!.price.toString() +
                                          "Tk",
                                      style: GoogleFonts.poppins(
                                        color: MyColor.lightGreyBorder,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : Text(
                                      widget.productData!.price.toString() +
                                          "Tk",
                                      style: GoogleFonts.poppins(
                                        color: MyColor.Black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
