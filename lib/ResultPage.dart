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
                            children: const [
                              Text('Result',style: TextStyle(fontSize: 50),),
                              SizedBox(height: 50,),
                              Text('Time',style: TextStyle(fontSize: 50),),
                              Text('タイム',style: TextStyle(fontSize: 50),),//ここにタイムを表示
                              SizedBox(height: 50,),
                              Text('Score',style: TextStyle(fontSize: 50),),
                              Text('スコア',style: TextStyle(fontSize: 50),)//ここにスコアを表示
                            ],
                          ),
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
                                          child: Text('ホーム画面に戻る',style: TextStyle(fontSize: 25,color: Colors.white),),
                                        )
                                      ],
                                    ),
                                ),
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
                                          child: Text('リトライ',style: TextStyle(fontSize: 25,color: Colors.white),),
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
