import 'dart:developer';

import 'package:emall_proj/Components/CallBacks/Callbacks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildListTile(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildExpansionTile(
      BuildContext context, MyDrawerExpansionPanelCallback callback);
}

class Item implements ListItem {
  Item({required this.title, this.item});

  String title;
  List<Item>? item;

  List<Widget> listmapper(List<Item> item) {
    return item
        .map(
          (itm) => (itm.item != null)
              ? ExpansionTile(
                  title: Text(itm.title),
                  children: listmapper(itm.item!),
                )
              : ListTile(
                  title: Text(itm.title),
                  onTap: () {
                    log(title);
                  },
                ),
        )
        .toList();
  }

  @override
  Widget buildExpansionTile(
      BuildContext context, MyDrawerExpansionPanelCallback callback) {
    return ExpansionTile(
        title: Text(this.title),
        children: listmapper(item!),
        onExpansionChanged: callback);
  }

  @override
  Widget buildListTile(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        log(title);
      },
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<Item> item = [
    Item(title: "Main Item"),
    Item(
      title: "Second Item",
      item: [
        Item(title: "Item 1"),
        Item(title: "Item 1", item: [
          Item(title: "Sub item 1"),
          Item(title: "Sub item 1"),
        ]),
        Item(title: "Item 1"),
      ],
    ),
    Item(title: "Third Item"),
    Item(title: "Fourth Item"),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return (item[index].item != null)
                ? item[index]
                    .buildExpansionTile(context, (val) => {setState(() {})})
                : item[index].buildListTile(context);
          }),
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
