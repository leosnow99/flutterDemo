import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderConsumerDemo extends StatefulWidget {
  @override
  _ProviderConsumerDemoState createState() => _ProviderConsumerDemoState();
}

class _ProviderConsumerDemoState extends State<ProviderConsumerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderConsumerDemo'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ProviderModel(),
        child: Center(
            child: Column(
              children: [
                Consumer<ProviderModel>(
                  builder: (BuildContext context,ProviderModel provider, child) {
                    print("Consumer is build");

                    return Column(
                      children: [
                        Text('value: ${provider.value}'),
                        SizedBox(height: 30.0,),
                        RaisedButton(onPressed: provider.plus, child: Text('plus'),)
                      ],
                    );
                  },
                  child: Text('child'),
                ),
                SizedBox(height: 30.0,),
                Selector(builder: (ctx, value, child){
                  print("selector is build");

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("value: $value"),
                      SizedBox(height: 30.0,),
                    ],
                  );
                 }, selector: (BuildContext  ctx, ProviderModel model) => model.value2)
              ],
            ),
        ),
      ),
    );
  }
}


class ProviderModel extends ChangeNotifier {
  List demo = [1,3];

  ProviderModel();

  int get value2 => demo[1];

  int get value => demo[0];

  void plus() {
    demo[0] = demo[0] + 1;
    notifyListeners();
  }
}
