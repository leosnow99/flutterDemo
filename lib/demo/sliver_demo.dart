import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninghao/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("DEMO"),
          ),
          // SliverPadding(padding: EdgeInsets.all(8.0), sliver: SliverGridDemo(),),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(3.0),
              sliver: SliverListDemoB(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(14.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.7),
              child: Stack(children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
                ),
                Positioned(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts[index].author,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        posts[index].title,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ],
                  ),
                  top: 32.0,
                  left: 32.0,
                )
              ]),
            ));
      }, childCount: posts.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        );
      }),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 8.0,
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, //显示的比例
      ),
    );
  }
}

class SliverListDemoB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              elevation: 14.0,
              shadowColor: Colors.grey[100].withOpacity(0.5),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.network(
                          posts[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
