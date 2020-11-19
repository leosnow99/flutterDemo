import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _selectTime = TimeOfDay(hour: 9, minute: 18);

  void _selectTimer( ) async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: _selectTime,
    );

    if (time == null) return;
    setState(() {
      this._selectTime = time;
    });
  }

  void _selectDate() async {
    final DateTime data = await showDatePicker(
        context: context, initialDate: _dateTime, firstDate: DateTime(1900), lastDate: DateTime(2021));
    if (data == null) {
      return;
    }
    setState(() {
      this._dateTime = data;
    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: [
                      Text(DateFormat.yMd().format(_dateTime)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTimer,
                  child: Row(
                    children: [
                      Text(_selectTime.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
