import 'package:flutter/material.dart';
import 'package:ninghao/model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTableDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DataTable(
                onSelectAll: (bool value) {
                  setState(() {
                    posts.forEach((e) => {if (e.selected != value) e.selected = value});
                  });
                },
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  // DataColumn(label: Container(width: 150.0, child: Text('Title'),)),
                  DataColumn(
                      label: Text('Title'),
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortAscending = ascending;
                          _sortColumnIndex = index;

                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('Image')),
                ],
                rows: posts
                    .map((post) => DataRow(
                            cells: [
                              DataCell(Text(post.title)),
                              DataCell(Text(post.author)),
                              DataCell(Image.network(post.imageUrl)),
                            ],
                            selected: post.selected,
                            onSelectChanged: (bool value) {
                              setState(() {
                                if (post.selected != value) {
                                  post.selected = value;
                                }
                              });
                            }))
                    .toList()
                // DataRow(cells: [
                //   DataCell(
                //     Text('hello'),
                //   ),
                //   DataCell(
                //     Text('leo'),
                //   ),
                // ]),
                )
          ],
        ),
      ),
    );
  }
}
