import 'package:flutter/material.dart';
import 'dart:math';

//Teste de importação de um widget próprio
import 'widgets/teste.dart';
import 'widgets/desafio_elevated.dart';
import 'widgets/banner_widget.dart';

//Teste do widget de jogo random
import 'widgets/select_console.dart';

//Teste
import 'widgets/metodo_param.dart';

void main() {
  runApp(const MyApp());
}

//MyApp serve aqui como o 'container' principal, que encapsula
//as definições básicas e também as telas do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        //Aqui a gente consegue definir a cor de fundo base para todas as telas
        //scaffoldBackgroundColor: Colors.brown),
      ),
      home: const MyHomePage(title: ' Dragon Quest Journey'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _animatedTrigger = false;
  String _ioText = '';

  String _btnMsg = 'Teste de botão';
  bool _btnMsgTextControl = false;
  int _btnColor = 0xFF8B8878;

  final int heitorColor = 0xFFFF8C00;
  final int daniColor = 0xFF8A2BE2;

  String _elevatedWidgetText = 'Botão Widget Externo, quando clicar, muda';
  void _metodoParametro() {
    setState(() {
      _elevatedWidgetText = 'Mudou!';
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  //A lógica é simples, quando o botão for acionado, haverá uma série de mudança
  //de estados, alterando o texto, e também a cor do botão.
  void _changeBtnText() {
    if (_btnMsgTextControl) {
      setState(() {
        _btnMsgTextControl = !_btnMsgTextControl;
        _btnMsg = 'Heitor';
        _btnColor = heitorColor;
      });
    } else {
      setState(() {
        _btnMsgTextControl = !_btnMsgTextControl;
        _btnMsg = 'Daniela';
        _btnColor = daniColor;
      });
    }
  }

  void _callBackComParam(String a) {
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.r
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        //Leading é um ícone que vem ANTES do title
        leading: Icon(
          Icons.account_balance_sharp,
          color: Colors.blue[50],
        ),
        //Actions vem depois do title, aqui podemos definir por exemplo, botões
        //com método atrelados aos mesmos.
        actions: <Widget>[
          IconButton(
            onPressed: _changeBtnText,
            icon: Icon(Icons.ac_unit, color: Colors.amber[50]),
            tooltip: 'Teste de ícone com método',
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Image.asset('assets/images/dqLogo.png',
                  width: 250, height: 200, fit: BoxFit.contain)),
          //Center

          //Widgets externos próprios
          const Teste(textoParam: 'String recebida como parâmetro'),
          const BannerWidget(bannerText: 'Widget externo'),
          MetodoParam(title: 'Alguma Coisa', pressedMethod: _callBackComParam),
          DesafioElevated(
            title: _elevatedWidgetText,
            pressedMethod: _metodoParametro,
          ),
          const Center(
              child: Text(
            'You have pushed the button this many times:',
          )),
          //TextField
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(children: [
              Text(_ioText),
              TextField(
                  onChanged: (text) {
                    setState(() {
                      _ioText = text;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: 'aqui é uma label',
                      border: OutlineInputBorder()))
            ]),
          ),

          Center(
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ))),
          ElevatedButton(
              onPressed: _changeBtnText,
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(_btnColor)),
              child: Text(_btnMsg)),

          //Animação básica (aliada com um Trigger)
          //Gesture Detector define uma ação quando determinada área
          //da tela for tocada sem ser um botão.
          //A ação ocorre a partir do 'onTap'
          //O que vai ser renderizado como limite do Gesture fica
          //dentro do child
          //Doc :: https://api.flutter.dev/flutter/widgets/GestureDetector-class.html
          GestureDetector(
            onTap: () {
              setState(() {
                _animatedTrigger = !_animatedTrigger;
              });
            },
            child: Center(
              child: //Tentativa de adicionar animação
                  AnimatedContainer(
                color: _animatedTrigger ? Colors.red : Colors.blue,
                duration: const Duration(milliseconds: 1750),
                curve: Curves.fastOutSlowIn,
                alignment: _animatedTrigger
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                height: 200,
                width: 100,
                child: Image.asset(
                  'assets/images/dqLogo.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),

          const SelectConsole(),

          Image.asset('assets/images/slime.png',
              width: 100, height: 100, fit: BoxFit.contain)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//Classe que gera uma nova 'curve', para criar a animação
//de subir e descer do dado
class SineCurve extends Curve {
  final double count;
  final double pi = 3.141592;

  const SineCurve({this.count = 3});

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}
