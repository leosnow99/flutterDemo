import 'package:flutter/material.dart';
import 'package:ninghao/model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts
              .map((e) => Card(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                            child: Image.network(
                              e.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(e.imageUrl),
                          ),
                          title: Text(e.title),
                          subtitle: Text(e.author),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            e.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // ButtonBarTheme(
                        //   data: ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.primary),
                        //   child: FlatButton(
                        //     child: Text("Like".toUpperCase()),
                        //     onPressed: () {},
                        //   ),
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RaisedButton(
                              color: Colors.white,
                              child: Text("Like".toUpperCase()),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RaisedButton(
                              child: Text("Read".toUpperCase()),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        )
                        // ButtonBarTheme(
                        //   data: ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.primary),
                        //   child: FlatButton(
                        //     child: Text("Read".toUpperCase()),
                        //     onPressed: () {},
                        //   ),
                        // )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
