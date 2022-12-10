import 'package:flutter/material.dart';
import 'LoginPage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(//画面左の半透明コンテイナー
                          width: 500,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            ShaderMask(shaderCallback: (Rect rect) {return LinearGradient(colors: [HexColor('ffff00'),HexColor('ffd700'),HexColor('ffa500')]).createShader(rect);  },
                               child: const Text('Result',style: TextStyle(color:Colors.white,fontSize: 50,fontFamily: 'Orbitron'))),
                              const SizedBox(height: 50,),
                              const Text('Time',style: TextStyle(color:Colors.black54,fontSize: 50,fontFamily: 'Orbitron')),
                              Text('タイム',style: TextStyle(fontSize: 50)),//ここにタイムを表示
                              const SizedBox(height: 50,),
                              const Text('Score',style: TextStyle(color:Colors.black54,fontSize: 50,fontFamily: 'Orbitron')),
                              //if(得点>最高得点)Row(mainAxisAlignment:MainAxisAlignment.center,children:  [SizedBox(width:200),Text('BestScore!',style: TextStyle(fontFamily:'Orbitron',fontSize:25,color: Colors.yellow[700]),)]),//最高得点で表示
                              Text('スコア',style: TextStyle(fontSize: 50)),//ここにスコアを表示
                            ]
                          )
                        ),
                        SizedBox(//画面右のwidgetツリー
                          width: 600,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 195,
                                child: InkWell(
                                  onTap: (){
                                    //Navigator.push(
                                    //    context,
                                    //    MaterialPageRoute(builder: (context) => ホーム画面のクラス(),
                                    //    ));
                                  },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 160,
                                          height: 160,
                                          child: Icon(Icons.home,size: 160,color: Colors.white,),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          height: 35,
                                          child: Text('ホーム画面に戻る',style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'NotoSansJP')),
                                        )
                                      ]
                                    )
                                )
                              ),
                              SizedBox(
                                width: 200,
                                height: 195,
                                child: InkWell(
                                  onTap: (){},//リトライの処理を追加
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        width: 160,
                                        height: 160,
                                        child: Icon(Icons.replay,size: 160,color: Colors.white,),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        height: 35,
                                        child:Center(
                                          child: Text('リトライ',style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'NotoSansJP')),
                                        )
                                      )
                                    ]
                                  )
                                )
                              )
                            ]
                          )
                        )
                      ]
                    )
                )
            )
        )
    );
  }
}
