import 'package:flutter/material.dart';
import 'LoginPage.dart';

class PlayingPage extends StatefulWidget {
  const PlayingPage({Key? key}) : super(key: key);

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(//テキスト入力時のはみ出し対策
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
              child:Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(//制限時間を表示する場所
                            margin: const EdgeInsets.only(top: 30),
                            width: 1100,
                            height: 70,
                            child:Text('制限時間:',style:const TextStyle(color:Colors.black87,fontSize: 40,fontFamily: 'NotoSansJP',fontWeight: FontWeight.w900)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: 150,
                            height: 70,
                            child: ElevatedButton(//中止ボタン
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              onPressed:(){},//中止の処理を追加
                              child: const Text('中止',style: TextStyle(fontSize: 40,fontFamily: 'NotoSansJP',fontWeight: FontWeight.w900)),
                            )
                          )
                        ]
                      ),
                      Column(
                        children: [
                          Container(//テキスト表示側
                            margin: const EdgeInsets.only(top: 50),
                            width: 700,
                            height: 150,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                '表示するテキスト',
                                style: const TextStyle(color:Colors.black87,fontSize: 30),
                              )
                            )
                          ),
                          Container(//テキスト入力側
                            margin: const EdgeInsets.only(top: 50),
                            width: 700,
                            height: 150,
                            color: Colors.white,
                            child: Center(
                              child: TextFormField(
                                autofocus: true,//自動で入力状態にするやつ
                                style: const TextStyle(color:Colors.black87,fontSize: 30),
                                decoration: const InputDecoration(//下線を非表示
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                onChanged: (text){},//テキスト入力時の処理を追加
                              )
                            )
                          )
                        ]
                      )
                    ]
                  )
              )
            )
        )
    );
  }
}
