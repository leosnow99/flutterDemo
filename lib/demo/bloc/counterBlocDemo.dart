import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider
        .of(context)
        .bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text("${snapshot.data}"),
            onPressed: () {
              _counterBloc._counterActionController.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider
        .of(context)
        .bloc;
    return FloatingActionButton(
      onPressed: () {
        _counterBloc.counter.add(2);
      },
      child: Icon(Icons.add),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  const CounterProvider({@required this.child, this.bloc})
      : assert(child != null),
        super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  final _counterController = StreamController<int>();

  Stream<int> get count => _counterController.stream;

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void log() {
    print('bloc');
  }

  void dispose() {
    _counterActionController.close();
    _counterController.close();
  }
}
