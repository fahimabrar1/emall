import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../MyGlobalVariables.dart';
import 'Product.dart';

class ProductsInToday extends StatefulWidget {
  const ProductsInToday({Key? key}) : super(key: key);

  @override
  _ProductsInTodayState createState() => _ProductsInTodayState();
}

class _ProductsInTodayState extends State<ProductsInToday> {
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
                          top: 50,
                          bottom: 74),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products In Today",
                            style: GoogleFonts.poppins(
                                fontSize: 34, fontWeight: FontWeight.w300),
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
