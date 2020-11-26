import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;

  //曲线动画
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      // lowerBound: 32.0,
      // upperBound: 100.0,
      // value: 32.0,
      duration: Duration(milliseconds: 1000),
      //动画时长
      vsync: this,
    );
    curve = CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    animation = Tween(begin: 32.0, end: 100.0).animate(curve); //范围值
    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    animationController.addListener(() {
      // print('${animationController.value}');
      setState(() {});
    });

    animationController.addStatusListener((status) {
      print(status);
    });

    // animationController.forward(); //开始播放动画
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: AnimatedHeart(animations: [animation, animationColor], controller: animationController));
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({@required this.animations, @required this.controller}) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: animations[1].value,
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      onPressed: () {
        // animationController.forward();
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}
