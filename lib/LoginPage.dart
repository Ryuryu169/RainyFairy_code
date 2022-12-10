import 'package:flutter/material.dart';
//ユーザーネーム入力場所⇒60、メルアド入力場所⇒80、パスワード入力場所⇒99
//ログインボタン⇒121、サインインボタン⇒131

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(//ロゴかタイトルに後で変更
                                    margin: const EdgeInsets.all(50),
                                    width: 350,
                                    height: 350,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(child: Text('アプリ名',style: TextStyle(fontSize: 40),),),
                                  ),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        const UNMAPWText(text: 'Username',),//->108
                                        SizedBox(
                                          width: 300,
                                          height: 70,
                                          child:TextFormField(//ユーザーネーム入力場所
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: 'ユーザーネーム',
                                            ),
                                            obscureText: false,
                                            onChanged: (text) {},
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return '入力されていません';
                                              }
                                              return null;
                                            },

                                          ),),
                                        const UNMAPWText(text: 'Mailaddress',),//->108
                                        SizedBox(
                                          width: 300,
                                          height: 70,
                                          child:TextFormField(//メルアド入力場所
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: 'メールアドレス',
                                            ),
                                            obscureText: false,
                                            onChanged: (text) {},
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return '入力されていません';
                                              }
                                              return null;
                                            },
                                          ),),
                                        const UNMAPWText(text: 'Password',),//->108
                                        SizedBox(
                                          width: 300,
                                          height: 70,
                                          child:TextFormField(//パスワード入力場所
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: 'パスワード',
                                            ),
                                            obscureText: true,
                                            onChanged: (text) {},
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return '入力されていません';
                                              }
                                              return null;
                                            },
                                          ),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(right: 20),
                                                width: 130,
                                                height: 70,
                                                child: ElevatedButton(//ログインボタン
                                                    onPressed: (){
                                                      if (_formKey.currentState!.validate()) {

                                                      }
                                                    },
                                                    child: const Center(child: Text('ログイン',style: TextStyle(fontSize: 20,fontFamily: 'NotoSansJP',fontWeight: FontWeight.w900))))),
                                            SizedBox(
                                                width: 130,
                                                height: 70,
                                                child: ElevatedButton(//サインインボタン
                                                    onPressed: (){
                                                      if (_formKey.currentState!.validate()) {

                                                      }
                                                    },
                                                    child: const Center(child: Text('新規登録',style: TextStyle(fontSize: 20,fontFamily: 'NotoSansJP',fontWeight: FontWeight.w900))))),
                                          ],
                                        )
                                      ]
                                  )
                                ]
                            )
                        )
                    )
                )
            )
        )
    );
  }
}



class UNMAPWText extends StatelessWidget {//テキストウィジェットまとめたやつ
  const UNMAPWText({Key? key, required this.text,}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 30,
      child: Center(
          child:ShaderMask(shaderCallback: (Rect rect) {return LinearGradient(colors: [HexColor('ffff00'),HexColor('ffd700'),HexColor('ffa500')]).createShader(rect);  },//テキストグラデーション色指定
              child: Text(text,style: const TextStyle(color:Colors.white,fontSize: 30,fontFamily: 'Orbitron',fontWeight: FontWeight.w900)))),//テキスト関連
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