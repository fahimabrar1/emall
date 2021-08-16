import 'dart:convert';
import 'dart:developer';

import 'package:emall_proj/Components/Models/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../MyGlobalVariables.dart';
import 'Product.dart';
import 'package:http/http.dart' as http;

class ProductsInToday extends StatefulWidget {
  const ProductsInToday({Key? key}) : super(key: key);

  @override
  _ProductsInTodayState createState() => _ProductsInTodayState();
}

class _ProductsInTodayState extends State<ProductsInToday> {
  late Future<List<ProductModel>> productModelList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productModelList = fetchProduct();
  }

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

                                  child: FutureBuilder<List<ProductModel>>(
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                              ConnectionState.none &&
                                          !snapshot.hasData) {
                                        print(
                                            'project snapshot data is: ${snapshot.data}');
                                        print('Containeer');
                                        return Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.yellow,
                                        );
                                      }
                                      if (snapshot.hasData) {
                                        return GridView.builder(
                                          scrollDirection: Axis.horizontal,
                                          primary: false,
                                          controller: new ScrollController(
                                              keepScrollOffset: false),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisSpacing:
                                                      panelElementGaps,
                                                  childAspectRatio:
                                                      (productHeight /
                                                          productWidth),
                                                  crossAxisCount: 1),
                                          itemBuilder: (context, index) {
                                            if (snapshot.hasData) {
                                              print("Has Data");
                                            }
                                            print(
                                                'project snapshot data is: ${snapshot.data}');
                                            print('Grid');
                                            return Product(
                                              productData: ProductDataHolder(
                                                  title:
                                                      '${snapshot.data![index].name}',
                                                  price: snapshot
                                                      .data![index].price
                                                      .toDouble(),
                                                  imagePath:
                                                      hhtpGetProductImageUrl +
                                                          snapshot.data![index]
                                                              .product_id +
                                                          "/1",
                                                  boxfit: BoxFit.fitHeight),
                                            );
                                          },
                                        );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                    future: productModelList,
                                  ),

                                  //   child: GridView.count(
                                  //     scrollDirection: Axis.horizontal,
                                  //     primary: false,
                                  //     mainAxisSpacing: panelElementGaps,
                                  //     crossAxisCount: 1,
                                  //     childAspectRatio:
                                  //         (productHeight / productWidth),
                                  //     controller: new ScrollController(
                                  //         keepScrollOffset: false),
                                  //     shrinkWrap: true,
                                  //     children: <Widget>[
                                  //       Product(
                                  //           productData: ProductDataHolder(
                                  //               title: 'T-Shirt Summer Vibes',
                                  //               price: 120,
                                  //               imagePath:
                                  //                   'assets/images/products/product_1.jpg',
                                  //               boxfit: BoxFit.fitWidth)),
                                  //       Product(
                                  //           productData: ProductDataHolder(
                                  //               title: 'Loose Knit 3/4 Sleeve',
                                  //               price: 150,
                                  //               imagePath:
                                  //                   'assets/images/products/product_2.jpg',
                                  //               boxfit: BoxFit.fitWidth)),
                                  //       Product(
                                  //           productData: ProductDataHolder(
                                  //               title: 'Basic Slim Fit T-Shirt',
                                  //               price: 799.99,
                                  //               imagePath:
                                  //                   'assets/images/products/product_3.jpg',
                                  //               boxfit: BoxFit.fitWidth)),
                                  //       Product(
                                  //           productData: ProductDataHolder(
                                  //               title: 'T-Shirt Summer Vibes',
                                  //               price: 120,
                                  //               imagePath:
                                  //                   'assets/images/products/product_4.jpg',
                                  //               boxfit: BoxFit.fitWidth)),
                                  //       Product(
                                  //           productData: ProductDataHolder(
                                  //               title: 'Loose Textured T-Shirt',
                                  //               price: 1150,
                                  //               imagePath:
                                  //                   'assets/images/products/product_5.jpg',
                                  //               boxfit: BoxFit.fitWidth)),
                                  //       Product(
                                  //           productData: ProductDataHolder(
                                  //               title: 'T-Shirt Summer Vibes',
                                  //               price: 120,
                                  //               imagePath:
                                  //                   'assets/images/products/product_1.jpg',
                                  //               boxfit: BoxFit.fitWidth)),
                                  //     ],
                                  //   ),
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

  Future<List<ProductModel>> fetchProduct() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/products/select/1/2'));

    List<ProductModel> _postList = <ProductModel>[];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      //print(response.body);
      List<dynamic> values;
      values = jsonDecode(response.body);
      print(values.length.toString());
      print(values.toString());

      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            log(values[i].toString());
            Map<String, dynamic> map = values[i];
            _postList.add(ProductModel.fromJson(map));
          }
        }
      }
      // Map<String, dynamic> map = jsonDecode(response.body)[0];
      // return ProductModel.fromJson(map);
      return _postList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
