import 'package:flutter/material.dart';
import 'TodoItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TodoList(),
    );
  }
}

class Todo {
  String text;
  bool checked;

  Todo({this.text, this.checked: false});
  String toString() => "$text - $checked";
}

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  List<Todo> todos =  [
    new Todo(text: "Task1"),
    new Todo(text: "Task2"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: new Center(
        child: new Column(
          children: buildTodoList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () => print('press'),
      ),
    );
  }

  List<Widget> buildTodoList() {
    return todos.map((item) => new TodoItem(text: item.text, checked: item.checked)).toList();
  }

  Widget buildItem(Todo item) {
    print(item.text);
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
            item.text,
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
                    value: item.checked,
                    onChanged: (val) => print(val),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}


