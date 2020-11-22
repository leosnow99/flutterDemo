import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['Apple', 'Orange', 'Banana'];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              Chip(label: Text('Life')),
              Chip(
                label: Text("Sunset"),
                backgroundColor: Colors.orange,
              ),
              Chip(
                label: Text('Tomorrow'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text("火"),
                ),
              ),
              Chip(
                label: Text('leosnow'),
                avatar: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://cdn.pixabay.com/photo/2020/11/08/16/57/forest-5724397_960_720.jpg'),
                ),
              ),
              Chip(
                label: Text('City'),
                onDeleted: () {},
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.redAccent,
                deleteButtonTooltipMessage: 'Remove this tag',
              ),
              Divider(
                height: 32.0,
                indent: 12.0, //分割符缩进
              ),
              Wrap(
                spacing: 8.0,
                children: _tags
                    .map((tag) => Chip(
                          label: Text(tag),
                          onDeleted: () {
                            setState(() {
                              _tags.remove(tag);
                            });
                          },
                        ))
                    .toList(),
              ),
              Divider(
                height: 32.0,
                indent: 12.0, //分割符缩进
              ),
              Container(
                width: double.infinity,
                child: Text(_action)
              ),
              Wrap(
                spacing: 8.0,
                children: _tags.map((tag) => ActionChip(
                          label: Text(tag),
                          onPressed: (){
                            setState(() {
                              _action = tag;
                            });
                          },
                        ))
                    .toList(),
              ),
              Divider(
                height: 32.0,
                indent: 12.0, //分割符缩进
              ),
              Container(
                width: double.infinity,
                child: Text("filterChip: ${_selected.toString() }")
              ),
              Wrap(
                spacing: 8.0,
                children: _tags.map((tag) => FilterChip(
                          label: Text(tag),
                          selected: _selected.contains(tag),
                          onSelected: (value) {
                            setState(() {
                              if(_selected.contains(tag)) {
                                _selected.remove(tag);
                              } else {
                                _selected.add(tag);
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
              Divider(
                height: 32.0,
                indent: 12.0, //分割符缩进
              ),
              Container(
                  width: double.infinity,
                  child: Text("filterChip: ${_selected.toString() }")
              ),
              Wrap(
                spacing: 8.0,
                children: _tags.map((tag) => ChoiceChip(
                  label: Text(tag),
                  selected: _choice == tag,
                  onSelected: (value) {
                    setState(() {
                      _choice = tag;
                    });
                  },
                ))
                    .toList(),
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'Orange', 'Banana'];
            _selected = [];
            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
