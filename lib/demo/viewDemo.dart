import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      //控制显示
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // crossAxisCount: 3,
          maxCrossAxisExtent: 200.0,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 6.0),
      itemBuilder: _gridItemBuilder,
      itemCount: posts.length,
    );
  }
}
//交叉轴最大尺寸
class GridViewExtendDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildTiles(int length) {
      return List.generate(length, (index) {
        return Container(
            color: Colors.grey[300],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "Item",
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ));
      });
    }

    return GridView.extent(
        maxCrossAxisExtent: 150.0,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        scrollDirection: Axis.horizontal,
        //排列方向
        children: _buildTiles(100));
  }
}

class GridViewCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildTiles(int length) {
      return List.generate(length, (index) {
        return Container(
            color: Colors.grey[300],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "Item",
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ));
      });
    }

    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        // scrollDirection: Axis.horizontal, //排列方向
        children: _buildTiles(100));
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(posts[index].author),
            ],
          ),
          bottom: 8.0,
          left: 8.0,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: _pageItemBuilder,
      itemCount: posts.length,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // reverse: true, //页面倒置
      onPageChanged: (currentPage) => debugPrint("page:$currentPage"),
      scrollDirection: Axis.vertical, //滚动方向
      controller: PageController(initialPage: 1, keepPage: false //记录页面位置
          ),
      children: [
        Container(
          color: Colors.brown,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "ONE",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "TWO",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[100],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "THREE",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
