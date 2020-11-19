import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = "Nothing";

  _openAlertDialog() async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('AlertDialog'),
              content: Text('Are you ok?'),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context, "Cancel");
                    },
                    child: Text('Cancel')),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context, "OK");
                    },
                    child: Text('OK')),
              ],
            ));
    if(result != null) {
      setState(() {
        this._choice = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your choice is: $_choice"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: _openAlertDialog,
                  child: Text("OpenAlertdialog"),
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
