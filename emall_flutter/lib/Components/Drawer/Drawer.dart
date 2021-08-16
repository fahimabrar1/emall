import 'dart:convert';
import 'dart:developer';

import 'package:emall_proj/Components/CallBacks/Callbacks.dart';
import 'package:emall_proj/Components/Models/AllCategoriesModel.dart';
import 'package:emall_proj/Components/MyGlobalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // List<Item> item = [
  //   Item(title: "Main Item"),
  //   Item(
  //     title: "Second Item",
  //     item: [
  //       Item(title: "Item 1"),
  //       Item(title: "Item 1", item: [
  //         Item(title: "Sub item 1"),
  //         Item(title: "Sub item 1"),
  //       ]),
  //       Item(title: "Item 1"),
  //     ],
  //   ),
  //   Item(title: "Third Item"),
  //   Item(title: "Fourth Item"),
  // ];

  List<CategoryItem> item = <CategoryItem>[];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: globalAllCategory.category.length,
        itemBuilder: (context, index) {
          return (globalAllCategory.category[index].item != null)
              ? globalAllCategory.category[index]
                  .buildExpansionTile(context, (val) => {setState(() {})})
              : globalAllCategory.category[index].buildListTile(context);
        },
      ),

      //,child: ListView(
      //   children: [
      //     ExpansionTile(
      //       title: Text("Main Item "),
      //       children: [
      //         ListTile(
      //           title: Text("Item 1"),
      //         ),
      //         ExpansionTile(
      //           title: Text("Item 1"),
      //           children: [
      //             ListTile(
      //               title: Text("Item 1"),
      //             ),
      //             ListTile(
      //               title: Text("Item 1"),
      //             ),
      //             ListTile(
      //               title: Text("Item 1"),
      //             ),
      //           ],
      //         ),
      //         ListTile(
      //           title: Text("Item 1"),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
