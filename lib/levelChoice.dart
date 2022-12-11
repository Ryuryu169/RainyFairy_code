import 'package:flutter/material.dart';
import 'dart:ui';

Color boxcolor = Colors.white;
Color eazyBoxcolor = Colors.greenAccent;
Color middleBoxcolor = Colors.blueAccent;
Color hardBoxcolor = Colors.redAccent;

class levelChoice extends StatefulWidget {
  const levelChoice({Key? key}) : super(key: key);

  @override
  State<levelChoice> createState() => _levelChoice();
}

class _levelChoice extends State<levelChoice> {
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(//テキスト入力時のはみ出し対策
        child:Form(
          key: _formKey,
          child: Container(//背景
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors:[HexColor('00bfff'),HexColor('20b2aa'),HexColor('2f4f4f')],//背景グラデーション色指定
                    center: Alignment.bottomLeft,
                    radius: 2.0
                )
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 200, height: 40,color: Colors.grey,
                    child: Center(
                        child: const Text("ホーム画面に戻る",style: TextStyle(fontFamily: "NotoSansJP",fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                    margin: EdgeInsetsDirectional.only(start: 0,top: 10,end: 800,bottom: 30),
                  ),
                  Container(
                    width: 1000,//MediaQuery.of(context).size.width-200,
                    height: 500,//MediaQuery.of(context).size.height-100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 200,
                      child: ScrollConfiguration(
                        behavior: CustomScrollBehavior(),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              if(index == 0) {
                                return Card(
                                  margin: EdgeInsetsDirectional.only(
                                    top: 30, bottom: 30, start: 30, end: 0,),
                                  child: Container(
                                    width: 500,
                                    color: boxcolor,
                                    margin: EdgeInsetsDirectional.only(start: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsetsDirectional.only(
                                              bottom: 240),
                                          child: Text(
                                            "C",
                                            style: TextStyle(
                                              fontSize: 165,
                                              fontFamily: 'NotoSansJP',
                                            ),),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: 20,),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                margin: EdgeInsetsDirectional.only(
                                                    start: 140),
                                                child: const Text(
                                                  '簡単',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: 'NotoSansJP',
                                                  ),),
                                                height: 110,
                                                width: 200,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      boxcolor,
                                                      eazyBoxcolor,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 30,),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                margin: EdgeInsetsDirectional.only(
                                                    start: 140),
                                                child: const Text(
                                                  '普通',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: 'NotoSansJP',
                                                  ),),
                                                height: 110,
                                                width: 200,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      boxcolor,
                                                      middleBoxcolor,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 30,),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                margin: EdgeInsetsDirectional.only(
                                                    start: 140),
                                                child: const Text(
                                                  '難しい',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: 'NotoSansJP',
                                                  ),),
                                                height: 110,
                                                width: 200,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      boxcolor,
                                                      hardBoxcolor,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Card(
                                  margin: EdgeInsetsDirectional.only(top: 30, bottom: 30, start: 30, end: 0,),
                              child: Container(
                              width: 500,
                              color: boxcolor,
                              margin: EdgeInsetsDirectional.all(10),
                                child:Text(
                                  "coming soon",
                                  style: TextStyle(
                                    fontSize: 100,
                                    fontFamily: 'NotoSansJP',
                                  ),),
                              ),
                              );
                            },
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class HexColor extends Color {//カラーコードをflutter用に直すやつ
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {hexColor = 'FF$hexColor';}
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}