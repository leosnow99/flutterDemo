import 'package:flutter/material.dart';

enum Option { A, B, C }

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';

  Future _openSimpleDialog() async {
    final result = await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text('SimpleDialog'),
              children: [
                SimpleDialogOption(
                  child: Text('Option A'),
                  onPressed: () {
                    Navigator.pop(context, Option.A);
                  },
                ),
                SimpleDialogOption(
                  child: Text('Option B'),
                  onPressed: () {
                    Navigator.pop(context, Option.B);
                  },
                ),
                SimpleDialogOption(
                  child: Text('Option C'),
                  onPressed: () {
                    Navigator.pop(context, Option.C);
                  },
                ),
              ],
            ));
    setState(() {
      switch (result) {
        case Option.A:
          this._choice = "Option A";
          break;
        case Option.B:
          this._choice = "Option B";
          break;
        case Option.C:
          this._choice = "Option C";
          break;
        default:
          this._choice = "Nothing";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleDialogDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The choice is: $_choice")
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}
