import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
        // .map((item) => 'item: $item')
        .debounceTime(Duration(milliseconds: 500))
        .where((event) => event.length > 10)
        .listen(print);

    // Stream.fromIterable(['hello', '你好']).listen(print);
    // Stream.fromFuture(Future.value('hello~~')).listen(print);
    // Stream.periodic(Duration(seconds: 3), (x) => x.toString()).listen(print);
    //
    // PublishSubject _subject = PublishSubject();
    //
    // _subject.listen((value) {
    //   print('listen 1  $value');
    // });
    // _subject.listen((value) {
    //   print('listen 2  $value');
    // });
    //
    // _subject.add('hello');
    //
    //
    // _subject.close();
  }

  @override
  void dispose() {
    _textFieldSubject.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,

      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
      ),
    );
  }
}
