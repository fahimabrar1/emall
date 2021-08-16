import 'package:emall_proj/Components/Cart/Cart.dart';
import 'package:emall_proj/Components/Product/ProductSearchPanel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Components/Product/Product.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/ShopScreen.dart';

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
    return ShopScreen();
    //return ProductPanal();
  }
}
