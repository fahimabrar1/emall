library my_prj.globals;

import 'package:emall_proj/Components/Product/Product.dart';
import 'package:flutter/cupertino.dart';

double borderMargin = 200;
double productWidth = 250;
double productHeight = 400;
double panelElementGaps = 20;
bool loggedIn = false;
double cardBorderRadius = 10;
double buttonBorderRadius = 50;
String hhtpGetProductImageUrl = "http://127.0.0.1:8000/api/images/";
String hhtpGetShopLogoUrl = "http://127.0.0.1:8000/api/logos/";
List<Product> globalproductList = [
  Product(
      productData: ProductDataHolder(
          title: 'T-Shirt Summer Vibes',
          price: 120,
          imagePath: 'assets/images/products/product_1.jpg',
          boxfit: BoxFit.fitWidth)),
  Product(
      productData: ProductDataHolder(
          title: 'Loose Knit 3/4 Sleeve',
          price: 150,
          imagePath: 'assets/images/products/product_2.jpg',
          boxfit: BoxFit.fitWidth)),
];
