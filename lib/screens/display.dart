import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todoapp/todo.dart';

class Display extends StatefulWidget {

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  List <Todos> _stateTodos;
  List <Todos> _statedeleted;

  @override
  void initState() {
    super.initState();
    _stateTodos = todos;
    _statedeleted = deleted;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _stateTodos.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 3.0,
          child: ListTile(
            leading: Icon(Icons.add_alarm, size: 20.0,),
            title: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Text(
                    _stateTodos[index].todo,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  child:  Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20.0,
                  ),
                  onPressed: () {
                    _statedeleted.add(_stateTodos[index]);
                    _stateTodos.remove(_stateTodos[index]);
                    setState(() {
                      todos = _stateTodos;
                      deleted = _statedeleted;
                    });
                  },
                ),
              )

              ],
            ),
            subtitle: Text(_stateTodos[index].time,
              style: TextStyle(
                color: Colors.grey,
              ),),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}