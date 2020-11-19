import 'package:flutter/material.dart';

class ExpansionPanelDemoState extends StatefulWidget {
  @override
  _ExpansionPanelDemoStateState createState() => _ExpansionPanelDemoStateState();
}

class _ExpansionPanelDemoStateState extends State<ExpansionPanelDemoState> {
  bool _isExpanded = false;
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
          "Panel A",
          Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text("Content for Panel A."),
          ),
          false),
      ExpansionPanelItem(
          "Panel B",
          Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text("Content for Panel B."),
          ),
          false),
      ExpansionPanelItem(
          "Panel C",
          Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text("Content for Panel C."),
          ),
          false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelDemoState"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems
                  .map((item) => ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            item.headerText,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        );
                      },
                      body: item.body,
                      isExpanded: item.isExpanded))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem(this.headerText, this.body, this.isExpanded);
}
