import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';

class Deleted extends StatefulWidget {

  @override
  _DeletedState createState() => _DeletedState();
}

class _DeletedState extends State<Deleted> {
  List <Todos> _stateDeleted;
  List <Todos> _stateTodos;

  @override
  void initState() {
    super.initState();
    _stateTodos = todos;
    _stateDeleted = deleted;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _stateDeleted.length,
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
                    _stateDeleted[index].todo,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child:  Icon(
                      Icons.restore,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    onPressed: () {
                      _stateTodos.add(_stateDeleted[index]);
                      _stateDeleted.remove(_stateDeleted[index]);
                      setState(() {
                        deleted = _stateDeleted;
                        todos = _stateTodos;
                      });
                    },
                  ),
                )

              ],
            ),
            subtitle: Text(_stateDeleted[index].time,
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