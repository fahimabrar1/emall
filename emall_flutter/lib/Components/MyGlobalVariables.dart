library my_prj.globals;

import 'package:emall_proj/Components/Models/AllCategoriesModel.dart';
import 'package:emall_proj/Components/Models/orderModel.dart';
import 'package:emall_proj/Components/Product/Product.dart';
import 'package:flutter/cupertino.dart';

import 'Drawer/Drawer.dart';

double borderMargin = 200;
double productWidth = 250;
double productHeight = 400;
double panelElementGaps = 20;
bool loggedIn = false;
double cardBorderRadius = 10;
double buttonBorderRadius = 50;
String hhtpGetProductImageUrl = "http://127.0.0.1:8000/api/images/";
String hhtpGetShopLogoUrl = "http://127.0.0.1:8000/api/logos/";

//late List<Item> item;
late Future<List<CategoryModel>> categorymodel;

List<Product> globalproductList = [
  Product(
    cartproductData: CartProductDataHolder(
      product_id: "1",
      shop_id: "shop1",
      title: 'T-Shirt Summer Vibes',
      price: 120,
      imagePath: 'assets/images/products/product_1.jpg',
      boxfit: BoxFit.fitWidth,
      quantity: 1,
    ),
  ),
  Product(
    cartproductData: CartProductDataHolder(
      product_id: "2",
      shop_id: "shop2",
      title: 'Loose Knit 3/4 Sleeve',
      price: 150,
      imagePath: 'assets/images/products/product_2.jpg',
      boxfit: BoxFit.fitWidth,
      quantity: 1,
    ),
  ),
];

List<orderModel> orderList = [];
