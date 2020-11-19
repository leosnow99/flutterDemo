import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  String _optionalValue = "Nothing";


  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text("01:30 / 03:30"),
              Expanded(
                  child: Text(
                'Fix you - Coldplay',
                textAlign: TextAlign.end,
              ))
            ],
          ),
        ),
      );
    });
  }

  Future _openModalBottomSheet() async {
   final result = await showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        height: 200.0,
        child: Column(
          children: [
            ListTile(
              title: Text("Option A"),
              onTap: () {
                Navigator.pop(context, 'A');
              },
            ),
            ListTile(
              title: Text("Option B"),
              onTap: () {
                Navigator.pop(context, 'B');
              },
            ),
            ListTile(
              title: Text("Option C"),
              onTap: () {
                Navigator.pop(context, 'C');
              },
            ),
          ],
        ),
      );
    });

   if(result != null) {
     setState(() {
       _optionalValue = result;
     });
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text("BottomSheetDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Optional value: $_optionalValue"),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(onPressed: _openBottomSheet, child: Text("Open BottomSheet")),
                FlatButton(onPressed: _openModalBottomSheet, child: Text("Modal BottomSheet")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
