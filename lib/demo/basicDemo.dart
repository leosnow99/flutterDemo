import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://images.pexels.com/photos/7294/garden.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.repeat
        ),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.pool,
              size: 32.0,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 52, 255, 1.0),
              border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid),
              // borderRadius: BorderRadius.all(Radius.circular(16.0)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(6.0, 7.0), //偏移量
                  color: Color.fromRGBO(16, 20, 188, 1.0), //颜色
                  blurRadius: 20.0, //模糊成度
                  spreadRadius: -9.0,
                ) //阴影扩散成度, 正数: 扩大阴影面积, 负数: 缩小阴影面积;
              ],
              shape: BoxShape.circle,
              //改变容器形状
              // gradient: RadialGradient(
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 20, 128, 1.0),
              //
              //   ]
              // )  //渐变效果 RadialGradient: 镜像渐变
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 20, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter), //渐变效果 LinearGradient: 线性
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'leosnow',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 34.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100),
            children: [
          TextSpan(
              text: '.com',
              style: TextStyle(fontSize: 17.0, color: Colors.grey)),
        ]));
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(fontSize: 16.0);

    final String _author = '韩非';
    final String _title = '韩非子';
    return Container(
      child: Text(
        "<<$_author>> --$_title \n臣闻：天下阴燕阳魏，连荆固齐，收韩而成从，将西面以与秦强为难。臣窃笑之。世有三亡，而天下得之，其此之谓乎！臣闻之曰：“以乱攻治者亡，以邪攻正者亡，以逆攻顺者亡”。今天下之府库不盈，囷仓空虚，悉其士民，张军数十百万，其顿首戴羽为将军断死于前不至千人，皆以言死。白刃在前，斧锧在后，而却走不能死也，非其士民不能死也，上不能故也。言赏则不与，言罚则不行，赏罚不信，故士民不死也。今秦出号令而行赏罚，有功无功相事也。出其父母怀衽之中，生未尝见寇耳。闻战，顿足徒裼，犯白刃，蹈炉炭，断死于前者皆是也。夫断死与断生者不同，而民为之者，是贵奋死也。夫一人奋死可以对十，十可以对百，百可以千，千可以对万，万可以克天下矣。今秦地折长补短，方数千里，名师数十百万。秦之号令赏罚，地形利害，天下莫若也。以此与天下，天下不足兼而有也。是故秦战未尝不克，攻未尝不取，所当未尝不破，开地数千里，此其大功也。然而兵甲顿，士民病，蓄积索，田畴荒，囷仓虚，四邻诸侯不服，霸王之名不成。此无异故，其谋臣皆不尽其忠也。",
        textAlign: TextAlign.left,
        style: _textStyle,
      ),
    );
  }
}
