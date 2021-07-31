import 'dart:developer';

import 'package:emall_proj/Components/CollectionBanners/CollectionBanner.dart';
import 'package:emall_proj/Components/MyColors.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:emall_proj/Components/Navbar/Navbar.dart';
import 'package:emall_proj/Components/Product/ProductViewPanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: MyColor.lightAmberBorderBackGround,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 700,
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                        image: AssetImage('images/home_background.jpg'),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Center(
                              child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.blue,
                            child: Shimmer.fromColors(
                                baseColor: Colors.white70,
                                highlightColor: Colors.grey,
                                enabled: true,
                                child: child),
                          ));
                          // You can use LinearProgressIndicator or CircularProgressIndicator instead
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Text('Some errors occurred!'),
                      ),
                    ),
                    TransparentNavBar(),
                  ],
                ),
              ],
            ),
            CollectionBannerPanel(),
            ProductViewPanel(),
          ],
        ),
      ),
    );
  }
}
