import 'package:emall_proj/Components/Product/Product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutItem extends StatelessWidget {
  Product product;

  CheckoutItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          //Avatar
          Expanded(
            child: CircleAvatar(
              backgroundImage: NetworkImage(product.cartproductData!.imagePath),
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
                  product.cartproductData!.product_id.toString(),
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
                (product.cartproductData!.color != null)
                    ? product.cartproductData!.color.toString()
                    : "",
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
                (product.cartproductData!.size != null)
                    ? product.cartproductData!.size.toString()
                    : "",
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
                product.cartproductData!.quantity.toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          //Product Price
          Expanded(
            child: Align(
              child: Text(
                (product.cartproductData!.quantity *
                        product.cartproductData!.price)
                    .toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
