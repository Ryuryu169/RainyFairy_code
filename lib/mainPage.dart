import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

List data = ['1　ユーザーネーム　スコア','2　ユーザーネーム　スコア','3　ユーザーネーム　スコア','4　ユーザーネーム　スコア','5　ユーザーネーム　スコア','6　ユーザーネーム　スコア','7　ユーザーネーム　スコア',];//ランキングのスコア
Color textColor = Colors.black87;//テキストの色
Color tileColor = Colors.white;//ランキングのタイルの色
int needleScore = 100;//右上の必要なスコア
int score = 500;//左上の自分のスコア
int allScore = 1000;//スコアの分母


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  var _count = 0;
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
              child: Container(
                width: 1000,//MediaQuery.of(context).size.width-200,
                height: 500,//MediaQuery.of(context).size.height-100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 35,end: 20,top: 65),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding:EdgeInsetsDirectional.only(end: 50),
                            child: Text(
                              'ランキング　現在の順位 : $score/$allScore',
                              style: TextStyle(
                                color: textColor,
                                fontSize:18,
                                fontFamily: 'NotoSansJP',
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Expanded(
                            child: Container(
                              height: 300,
                              width: 350,
                              child: ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  if (index == 6) {  // 最後のリストであることを確認したら、別の Widget を返す
                                    return IconButton(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      onPressed: (){
                                        setState(() {
                                          _count++;
                                        });
                                      },
                                    );
                                  }
                                  return Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder( // 枠線を変更できる
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    color: tileColor,
                                    child: ListTile(
                                      title: Text(
                                        data[index+_count],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'NotoSansJP',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: 300,
                        height: 300,
                        child: Image.asset('assets/images/egg.png')
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Bubble(
                            alignment: Alignment.bottomLeft,
                            nip: BubbleNip.leftBottom,
                            //color: ,
                            margin: const BubbleEdges.only(top: 0),
                            child: Column(
                              children: [
                                const Text(
                                    '順位をもう一つ上げるには\nあと,'
                                ),
                                Text(needleScore.toString(),style: TextStyle(fontSize: 29),),//文字大きくするためにテキストを分けている
                                Text('\n                        点必要です'),//右に寄せるために空白がある
                              ],
                            ),
                          ),
                          SizedBox(height: 160,),
                          Padding(//下のinkwellと合わせるためのpadding
                            padding: EdgeInsetsDirectional.only(start: 50),
                            child: InkWell(
                              onTap: (){},
                              child: Container(
                                width: 200,
                                height: 60,
                                padding: EdgeInsetsDirectional.only(top: 10),
                                child: Text(
                                  '設定',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'NotoSansJP',
                                  ),
                                ),
                                color: tileColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: 250,
                              height: 80,
                              padding: EdgeInsetsDirectional.all(12),
                              child: Text(
                                '言語選択へ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  fontSize: 35,
                                ),
                              ),
                              color: tileColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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