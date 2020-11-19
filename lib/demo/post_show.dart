import 'package:flutter/material.dart';
import 'package:ninghao/model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;



  PostShow({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${post.title}'),),
      body: Column(
        children: [
          Image.network(post.imageUrl),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${post.title}', style: Theme.of(context).textTheme.subtitle1,),
                Text('${post.author}', style: Theme.of(context).textTheme.subtitle2,),
                SizedBox(height: 32.0),
                Text('${post.description}', style: Theme.of(context).textTheme.bodyText1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
