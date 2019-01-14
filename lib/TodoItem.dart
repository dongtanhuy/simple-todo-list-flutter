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

  @override
  Widget build(BuildContext context) {
    return new Container (
      padding: const EdgeInsets.only(left: 15, right: 5),
      margin: const EdgeInsets.only(top:5, bottom:5),
      decoration: new BoxDecoration(
        border: new Border(top: BorderSide.none, left: BorderSide.none, right: BorderSide.none, bottom: BorderSide(width:1, style: BorderStyle.solid)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            text,
          ),
          Container(
              margin: const EdgeInsets.only(left: 40),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                        Icons.delete
                    ),
                    tooltip: 'Delete todo',
                    onPressed: () => print('deleted'),
                  ),
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