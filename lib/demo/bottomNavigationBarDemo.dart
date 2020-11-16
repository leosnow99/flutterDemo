import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onTapHandler(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: '探索'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: '历史'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: '列表'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '我'),
      ],
      fixedColor: Colors.black,
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
    );
  }
}
