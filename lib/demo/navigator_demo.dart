import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageDemo("Home"))),
                child: Text('Home')),
            FlatButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageDemo("About"))), child: Text('About')),
          ],
        ),
      ),
    );
  }
}

class PageDemo extends StatelessWidget {
  final String _title;

  PageDemo(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        elevation: 0.0,
      ),
      body: Center(
        child: FloatingActionButton(child: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),),
      ),
    );
  }
}
