import 'dart:js';

import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';

class ProductDataHolder {
  String title;
  String imagePath;
  BoxFit boxfit;
  double price;

  ProductDataHolder({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.boxfit,
  });
}

class Product extends StatefulWidget {
  final ProductDataHolder product;
  Product({required this.product, Key? key}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 400,
      //color: Colors.yellow.withOpacity(0.4),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  // child: Image(
                  //   image: AssetImage(widget.product.imagePath),
                  //   fit: widget.product.boxfit,
                  //   alignment: Alignment.center,
                  //   frameBuilder:
                  //       (context, child, frame, wasSynchronouslyLoaded) {
                  //     if (wasSynchronouslyLoaded) {
                  //       return child;
                  //     } else {
                  //       return AnimatedSwitcher(
                  //         duration: const Duration(milliseconds: 500),
                  //         child: frame != null
                  //             ? child
                  //             : CircularProgressIndicator(),
                  //       );
                  //     }
                  //   },
                  // ),

                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.product.imagePath),
                        fit: widget.product.boxfit,
                        alignment: Alignment.center),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(0.1),
                ),
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
                          widget.product.title,
                          style: GoogleFonts.poppins(
                              color: MyColor.Black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        Text(
                          widget.product.price.toString() + "Tk",
                          style: GoogleFonts.poppins(
                              color: MyColor.Black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
