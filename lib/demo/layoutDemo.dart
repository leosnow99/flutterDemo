import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return IconBadge(Icons.ac_unit)
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Container(
            color: Color.fromRGBO(3, 54, 255, 1.0),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 200.0, maxWidth: 200.0),
          child: Container(
            child: AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Container(
                color: Color.fromRGBO(3, 54, 255, 1.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(8.0)),
            child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(7, 104, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0)
                ])),
            child: Icon(Icons.brightness_1, color: Colors.white, size: 32.0),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 30.0,
          child: Icon(
            Icons.ac_unit,
            color: Colors.white,
            size: 32.0,
          ),
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
