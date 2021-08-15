import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../MyColors.dart';
import '../MyGlobalVariables.dart';
import 'Product.dart';

class ProductViewPanel extends StatefulWidget {
  const ProductViewPanel({Key? key}) : super(key: key);

  @override
  _ProductViewPanelState createState() => _ProductViewPanelState();
}

class _ProductViewPanelState extends State<ProductViewPanel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 700,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: borderMargin,
                          right: borderMargin,
                          top: 65,
                          bottom: 80),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Selected just for you",
                                style: GoogleFonts.poppins(
                                    color: MyColor.Black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              ElevatedButton(
                                child: Text(
                                  "SHOW MORE",
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
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: panelElementGaps,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 500,
                                  //color: Colors.red,
                                  child: GridView.count(
                                    scrollDirection: Axis.horizontal,
                                    primary: false,
                                    mainAxisSpacing: panelElementGaps,
                                    crossAxisCount: 1,
                                    childAspectRatio:
                                        (productHeight / productWidth),
                                    controller: new ScrollController(
                                        keepScrollOffset: false),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Product(
                                          productData: ProductDataHolder(
                                              title: 'T-Shirt Summer Vibes',
                                              price: 120,
                                              imagePath:
                                                  'assets/images/products/product_1.jpg',
                                              boxfit: BoxFit.fitWidth)),
                                      Product(
                                          productData: ProductDataHolder(
                                              title: 'Loose Knit 3/4 Sleeve',
                                              price: 150,
                                              imagePath:
                                                  'assets/images/products/product_2.jpg',
                                              boxfit: BoxFit.fitWidth)),
                                      Product(
                                          productData: ProductDataHolder(
                                              title: 'Basic Slim Fit T-Shirt',
                                              price: 799.99,
                                              imagePath:
                                                  'assets/images/products/product_3.jpg',
                                              boxfit: BoxFit.fitWidth)),
                                      Product(
                                          productData: ProductDataHolder(
                                              title: 'T-Shirt Summer Vibes',
                                              price: 120,
                                              imagePath:
                                                  'assets/images/products/product_4.jpg',
                                              boxfit: BoxFit.fitWidth)),
                                      Product(
                                          productData: ProductDataHolder(
                                              title: 'Loose Textured T-Shirt',
                                              price: 1150,
                                              imagePath:
                                                  'assets/images/products/product_5.jpg',
                                              boxfit: BoxFit.fitWidth)),
                                      Product(
                                          productData: ProductDataHolder(
                                              title: 'T-Shirt Summer Vibes',
                                              price: 120,
                                              imagePath:
                                                  'assets/images/products/product_1.jpg',
                                              boxfit: BoxFit.fitWidth)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
