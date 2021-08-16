import 'dart:developer';

import 'package:emall_proj/Components/CallBacks/Callbacks.dart';
import 'package:emall_proj/Components/Drawer/Drawer.dart';
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
  Item({required this.name, this.item});

  String name;
  List<Item>? item;

  List<Widget> listmapper(List<Item> item) {
    return item
        .map(
          (itm) => (itm.item != null)
              ? ExpansionTile(
                  title: Text(itm.name),
                  children: listmapper(itm.item!),
                )
              : ListTile(
                  title: Text(itm.name),
                  onTap: () {
                    log(name);
                  },
                ),
        )
        .toList();
  }

  @override
  Widget buildExpansionTile(
      BuildContext context, MyDrawerExpansionPanelCallback callback) {
    return ExpansionTile(
        title: Text(this.name),
        children: listmapper(item!),
        onExpansionChanged: callback);
  }

  @override
  Widget buildListTile(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: () {
        log(name);
      },
    );
  }
}

class CategoryItem implements ListItem {
  CategoryItem({required this.name, required this.category_id, this.item});

  String name;
  String category_id;
  List<CategoryItem>? item;

  List<Widget> listmapper(List<CategoryItem> item) {
    return item
        .map(
          (itm) => (itm.item != null)
              ? ExpansionTile(
                  title: Text(itm.name),
                  children: listmapper(itm.item!),
                )
              : ListTile(
                  title: Text(itm.name),
                  onTap: () {
                    log(name);
                  },
                ),
        )
        .toList();
  }

  @override
  Widget buildExpansionTile(
      BuildContext context, MyDrawerExpansionPanelCallback callback) {
    return ExpansionTile(
        title: Text(this.name),
        children: listmapper(item!),
        onExpansionChanged: callback);
  }

  @override
  Widget buildListTile(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: () {
        log(name);
      },
    );
  }
}

class SubCategoryItem implements ListItem {
  String sub_cat_id;
  String category_id_fk;
  String name;
  List<ChildSubCategoryitem>? item;

  SubCategoryItem(
      {required this.name,
      required this.category_id_fk,
      required this.sub_cat_id});

  @override
  Widget buildExpansionTile(
      BuildContext context, MyDrawerExpansionPanelCallback callback) {
    // TODO: implement buildExpansionTile
    throw UnimplementedError();
  }

  @override
  Widget buildListTile(BuildContext context) {
    // TODO: implement buildListTile
    throw UnimplementedError();
  }
}

class ChildSubCategoryitem {
  String child_cat_id;
  String name;
  String sub_cat_id_fk;
  ChildSubCategoryitem(
      {required this.name,
      required this.child_cat_id,
      required this.sub_cat_id_fk});
}

class CategoryModel {
  String category_id;
  String name;

  CategoryModel({required this.category_id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      category_id: json['category_id'],
      name: json['name'],
    );
  }
}

class SubCategoryModel {
  String sub_cat_id;
  String category_id_fk;
  String name;

  SubCategoryModel(
      {required this.name,
      required this.category_id_fk,
      required this.sub_cat_id});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      category_id_fk: json['category_id_fk'],
      name: json['name'],
      sub_cat_id: json['sub_cat_id'],
    );
  }
}

class ChildSubCategoryModel {
  String child_cat_id;
  String name;
  String sub_cat_id_fk;

  ChildSubCategoryModel(
      {required this.name,
      required this.child_cat_id,
      required this.sub_cat_id_fk});

  factory ChildSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return ChildSubCategoryModel(
      child_cat_id: json['child_cat_id'],
      name: json['name'],
      sub_cat_id_fk: json['sub_cat_id_fk'],
    );
  }
}

class globalCategory {
  static List<CategoryItem> item = <CategoryItem>[];
}

class globalSubCategory {
  static List<SubCategoryItem> item = <SubCategoryItem>[];
}

class globalChildSubCategory {
  static List<ChildSubCategoryitem> item = <ChildSubCategoryitem>[];
}

class globalAllCategory {
  static List<Item> category = <Item>[];
}
