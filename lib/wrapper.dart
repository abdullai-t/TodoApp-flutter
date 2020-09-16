import 'package:flutter/material.dart';
import 'package:todoapp/screens/deleted.dart';
import 'package:todoapp/screens/display.dart';
import 'package:todoapp/screens/input.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var _currentTab = 0;
   void _switchTab(int index) {
     setState(() {
       _currentTab  = index;
     });
   }
   List<Widget> _widgetOptions = <Widget>[
    Display(),
     Input(),
    Deleted(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text(
          "Todo App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10),
        child: _widgetOptions.elementAt(_currentTab ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            title: Text('Create'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            title: Text('Recycle'),
          ),
        ],
        currentIndex:_currentTab,
        selectedItemColor: Colors.blueAccent,
        onTap: _switchTab,
      ),
    );
  }
}