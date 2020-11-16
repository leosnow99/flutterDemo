import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("leosnow", style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text("leosnow@leo.ocm"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2233854763,678386514&fm=11&gp=0.jpg"),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[40],
                image: DecorationImage(
                    image: NetworkImage("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2878959227,1429898811&fm=11&gp=0.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.yellow[100].withOpacity(0.6),
                        BlendMode.softLight
                    )
                )
            ),
          ),
          ListTile(
            title: Text(
              "Messages",
              textAlign: TextAlign.left,
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "Messages",
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "Messages",
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
