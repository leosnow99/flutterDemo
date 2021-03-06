import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpDemo"),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    fetchPosts().then((value) => print(value));
  }

  Future<List<Post>> fetchPosts() async {
    final http.Response response = await http.get('https://resources.ninghao.net/demo/posts.json');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts'].map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        print('data: ${snapshot.data}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        return ListView(
          children: snapshot.data
              .map<Widget>((item) => ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.author),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.imageUrl),
                    ),
                  ))
              .toList(),
        );
      },
      future: fetchPosts(),
    );
  }
}

class Post {
  final int id;
  final String author;
  final String imageUrl;
  final String title;
  final String description;

  Post({this.title, this.description, this.id, this.author, this.imageUrl});

  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'],
        id = json['id'],
        author = json['author'],
        imageUrl = json["imageUrl"];

  Map toJson() => {'id': id, 'author': author, 'imageUrl': imageUrl, 'title': title, 'description': description};
}

class FutureBuilderDemo extends StatefulWidget {
  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  String showResult = '';

  Future fetchPost() async {
    final response = await http.get("www.baidu.com");
    var utf8decoder = Utf8Decoder();
    return json.decode(utf8decoder.convert(response.bodyBytes));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Input a URL to start');
          case ConnectionState.waiting:
            return new Center(child:  new CircularProgressIndicator(),);
          case ConnectionState.active:
            return new Text('');
          case ConnectionState.done:
            if (snapshot.hasError) {
              return new Text(
                '${snapshot.error}',
                style: TextStyle(color: Colors.red),
              );
            } else {
              return new Text('${snapshot.data}');
            }
        }
        return Text('');
      },
      future: fetchPost(),
    );
  }
}
