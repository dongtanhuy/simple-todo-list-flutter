import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String text;
  final bool checked;

  TodoItem({this.text, this.checked: false});
  @override
  State<StatefulWidget> createState() {
    return new _TodoItem(text, checked);
  }
}

class _TodoItem extends State<TodoItem> {
  bool checked = false;
  String text;

  _TodoItem(this.text, this.checked);
  void changeChecked(bool value) => setState(() => checked = value);

  TextStyle getTextStyle () => new TextStyle(
    color: checked ? Colors.red[500] : Colors.black,
    fontFamily: "Rubik",
    fontSize: 18.0,
    decoration: checked ? TextDecoration.lineThrough : TextDecoration.none,
    decorationColor: Colors.grey[500],
  );


  @override
  Widget build(BuildContext context) {
    return new Container (
      padding: const EdgeInsets.only(left: 15, right: 5),
      margin: const EdgeInsets.only(top:0, bottom:0),
      decoration: new BoxDecoration(
        border: new Border(top: BorderSide.none, left: BorderSide.none, right: BorderSide.none, bottom: BorderSide(color: Colors.grey[500] ,width:1, style: BorderStyle.solid)),
        color: checked ? Colors.lightGreenAccent : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            text,
            style: getTextStyle(),
          ),
          Container(
              margin: const EdgeInsets.only(left: 40),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: checked,
                    onChanged: changeChecked,
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}