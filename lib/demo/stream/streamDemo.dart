import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [StreamDemoHome()],
            )
          ],
        ),
      ),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _streamSink;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('create a stream');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast(); //多用户订阅
    _streamSink = _streamDemo.sink;

    print('start listening on a stream');
    _streamSubscription = _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    print('initialize completed');
  }

  void onData(String data) {
    print('OnData: $data');
    setState(() {
      _data = data;
    });
  }

  void onDataTwo(String data) {
    print('OnDataTWO: $data');
  }

  void onDone() {
    print('onDone');
  }

  void onError(err) {
    print('onError: $err');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    // throw 'Something happened!';
    return 'hello~~~';
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subscription');
    _streamSubscription.cancel();
  }

  void _addDataToStream() async {
    print('Add data to stream');
    String data = await fetchData();
    // _streamDemo.add(data);
    _streamSink.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(_data),
            StreamBuilder(
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
              stream: _streamDemo.stream,
            ),
            Row(
              children: [
                FlatButton(onPressed: _addDataToStream, child: Text("Add")),
                FlatButton(onPressed: _pauseStream, child: Text('Pause')),
                FlatButton(onPressed: _resumeStream, child: Text('Resume')),
                FlatButton(onPressed: _cancelStream, child: Text('Cancel')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
