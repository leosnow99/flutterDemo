import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninghao/demo/anmation/animationDemo.dart';
import 'package:ninghao/demo/basicDemo.dart';
import 'package:ninghao/demo/bloc/blocDemo.dart';
import 'package:ninghao/demo/bottomNavigationBarDemo.dart';
import 'package:ninghao/demo/drawer_demo.dart';
import 'package:ninghao/demo/form_demo.dart';
import 'package:ninghao/demo/http/httpDemo.dart';
import 'package:ninghao/demo/listView-demo.dart';
import 'package:ninghao/demo/rxdart/rxdartDemo.dart';
import 'package:ninghao/demo/sliver_demo.dart';
import 'package:ninghao/demo/stream/streamDemo.dart';
import 'package:ninghao/state/stateManagementDemo.dart';
import 'demo/MaterialComponents.dart';
import 'demo/navigator_demo.dart';
import 'demo/provider/providerConsumerDemo.dart';
import 'demo/viewDemo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/ProviderConsumerDemo",
      routes: {
        '/': (context) => Home(),
        '/about': (context) => PageDemo("ni"),
        '/about/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/stateManagement': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxDart': (context) => RxDartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/ProviderConsumerDemo': (context) => ProviderConsumerDemo(),

      },
      // home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.blue,
          buttonColor: Colors.lightGreen,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: "Navigation",
          //   onPressed: () => debugPrint("leadingButton clicked!"),
          // ),
          title: Text(
            "DEMO",
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), tooltip: "Search", onPressed: () => debugPrint("Search clicked!"))
          ],
          elevation: 10.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                icon: Icon(Icons.change_history),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.view_quilt),
              )
            ],
          ),
        ),
        body: TabBarViewDemo(),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

class AppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TabBarViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[ListViewDemo(), BasicDemo(), SliverDemo(), ViewDemo()],
    );
  }
}
