import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todoapp/todo.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String _todoItem;
  final _inputController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 200.0),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            cursorColor: Colors.amber,
            decoration: InputDecoration(
              hintText: "What is on your mind......",
            ),
            onChanged: (String item){
              setState(()=>_todoItem=item);
            },
            controller: _inputController,

          ),
          SizedBox(
            height: 60.0,
          ),
          Row(

            children: [
              Expanded(
                child: RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  onPressed: () {
                    Todos todoObj = new Todos(
                      todo:_todoItem,
                      time:DateTime.now().toString(),
                    );
                    todos.add(todoObj);
                    _inputController.clear();
                  },
                  child: Text("Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}