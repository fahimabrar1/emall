import 'dart:convert';
import 'dart:developer';

import 'package:emall_proj/Components/Cart/Cart.dart';
import 'package:emall_proj/Components/Product/ProductSearchPanel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Components/Drawer/Drawer.dart';
import 'Components/Models/AllCategoriesModel.dart';
import 'Components/MyGlobalVariables.dart';
import 'Components/Product/Product.dart';
import 'Components/Product/ProductPanal.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/ShopScreen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eMall',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        pageTransitionsTheme: NoTransitionsOnWeb(),
      ),
      home: MyeMall(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyeMall extends StatefulWidget {
  final String title;

  MyeMall({Key? key, required this.title}) : super(key: key);

  @override
  _MyeMallState createState() => _MyeMallState();
}

class _MyeMallState extends State<MyeMall> {
  bool gotcate = false;
  bool gotsubcate = false;
  bool gotcsubcate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCategory().whenComplete(() {
      gotcate = true;
      if (gotcate && gotcsubcate && gotsubcate) {
        startcal();
      }
    });
    fetchSubCategory().whenComplete(() {
      gotsubcate = true;
      if (gotcate && gotcsubcate && gotsubcate) {
        startcal();
      }
    });
    fetchChildSubCategory().whenComplete(() {
      gotcsubcate = true;
      if (gotcate && gotcsubcate && gotsubcate) {
        startcal();
      }
    });
  }

  void startcal() {
    List<Item> childsubcategory = <Item>[];
    List<Item> subcategory = <Item>[];
    for (var item in globalCategory.item) {
      globalAllCategory.category.add(new Item(name: item.name));
    }

    for (var item in globalSubCategory.item) {
      subcategory.add(new Item(name: item.name));
    }

    for (var item in globalChildSubCategory.item) {
      childsubcategory.add(new Item(name: item.name));
    }
    for (var item in globalChildSubCategory.item) {
      for (var i in globalSubCategory.item) {
        if (i.sub_cat_id == item.sub_cat_id_fk) {
          try {
            subcategory[globalSubCategory.item.indexOf(i)]
                .item!
                .add(new Item(name: item.name));
          } catch (e) {
            subcategory[globalSubCategory.item.indexOf(i)].item = <Item>[];
            subcategory[globalSubCategory.item.indexOf(i)]
                .item!
                .add(new Item(name: item.name));
          }
        }
      }
    }

    for (var item in globalSubCategory.item) {
      for (var i in globalCategory.item) {
        if (i.category_id == item.category_id_fk) {
          try {
            globalAllCategory.category[globalCategory.item.indexOf(i)].item!
                .add(subcategory[globalSubCategory.item.indexOf(item)]);
          } catch (e) {
            globalAllCategory.category[globalCategory.item.indexOf(i)].item =
                <Item>[];
            globalAllCategory.category[globalCategory.item.indexOf(i)].item!
                .add(subcategory[globalSubCategory.item.indexOf(item)]);
          }
        }
      }
    }
    // print("Printin");
    // for (var i in globalAllCategory.category) {
    //   print(i.name);
    //   if (i.item != null) {
    //     for (var j in i.item!) {
    //       log("Sub P  " + j.name);
    //       if (j.item != null) {
    //         for (var k in j.item!) {
    //           print("Child " + k.name);
    //         }
    //       }
    //     }
    //   }
    // }
  }

  //flutter run -d Chrome --web-renderer html
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Cart(),
    // );
    //return HomeScreen();
    //return ProductSearchPanel();
    // return Scaffold(
    //   body: Product(product: ProductDataHolder(
    //       title: 'T-Shirt Summer Vibes',
    //       price: 120,
    //       imagePath: 'assets/images/products/product_1.jpg',
    //       boxfit: BoxFit.fitWidth),),
    // );
    //return ShopScreen();
    return ProductPanal();
  }

  Future<List<CategoryModel>> fetchCategory() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/categories'));

    List<CategoryModel> _categoryList = <CategoryModel>[];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      //print(response.body);
      List<dynamic> values;
      values = jsonDecode(response.body);
      // print(values.length.toString());
      // print(values.toString());
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            //log(values[i].toString());
            Map<String, dynamic> map = values[i];
            globalCategory.item.add(
              CategoryItem(
                name: map['name'],
                category_id: map['category_id'],
              ),
            );
            _categoryList.add(
              CategoryModel.fromJson(map),
            );
          }
        }
      }
      return _categoryList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<SubCategoryModel>> fetchChildSubCategory() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/subcategories'));

    List<SubCategoryModel> _categoryList = <SubCategoryModel>[];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      //print(response.body);
      List<dynamic> values;
      values = jsonDecode(response.body);
      // print(values.length.toString());
      // print(values.toString());
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            //log(values[i].toString());
            Map<String, dynamic> map = values[i];
            globalSubCategory.item.add(
              SubCategoryItem(
                name: map['name'],
                category_id_fk: map['category_id_fk'],
                sub_cat_id: map['sub_cat_id'],
              ),
            );
            _categoryList.add(
              SubCategoryModel.fromJson(map),
            );
          }
        }
      }
      return _categoryList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<ChildSubCategoryModel>> fetchSubCategory() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/childcategories'));

    List<ChildSubCategoryModel> _categoryList = <ChildSubCategoryModel>[];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      //print(response.body);
      List<dynamic> values;
      values = jsonDecode(response.body);
      // print(values.length.toString());
      // print(values.toString());
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            //log(values[i].toString());
            Map<String, dynamic> map = values[i];
            globalChildSubCategory.item.add(
              ChildSubCategoryitem(
                  name: map['name'],
                  child_cat_id: map['child_cat_id'],
                  sub_cat_id_fk: map['sub_cat_id_fk']),
            );
            _categoryList.add(
              ChildSubCategoryModel.fromJson(map),
            );
          }
        }
      }
      return _categoryList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
