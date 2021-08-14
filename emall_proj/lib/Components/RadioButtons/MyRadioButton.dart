import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioModel {
  bool isSelected;

  Color color;

  RadioModel(this.isSelected, this.color);
}

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({Key? key}) : super(key: key);

  @override
  _MyRadioButtonState createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(10),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 40.0,
            width: 40.0,
            child: new Center(
                child: new Container(
              margin: EdgeInsets.all(5),
              color: _item.color,
            )),
            decoration: new BoxDecoration(
              color: _item.isSelected ? _item.color : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? _item.color : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
}
