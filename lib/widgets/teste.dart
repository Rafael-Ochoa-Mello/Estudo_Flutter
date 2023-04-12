import "package:flutter/material.dart";

class Teste extends StatefulWidget {
  final String texto = 'Widget externo, texto dentro de um container';
  final String textoParam;

  const Teste({super.key, required this.textoParam});

  @override
  State<Teste> createState() => _Teste();
}

class _Teste extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    //Responsividade, vamos pegar as dimensões da tela do dispositivo,
    //assim, podemos definir valores cujo comportamento se manterão proporcionais
    //indiferente do tamanho de tela do mesmo.
    //A aplicação do valor é feita por uma multiplicação que representa uma
    //porcentagem da tela.
    //Ex:  margin:
    //        EdgeInsets.symmetric(horizontal: 0, vertical: deviceHeight * 0.2)

    //Para mais detalhes sobre isso, recomendo muito o artigo ::
    //https://blog.logrocket.com/flutter-layouts-guide-margins-padding/

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    //Como dá pra ver, o Container se comporta
    //basicamente como uma DIV

    //Nesse exemplo não foi definido tamanho (width & height)
    //então o comportamento vai ser de pegar o tamanho do filho aliado
    //as opções de margin e padding (se as mesmas forem definidas).
    //Caso o tamanho deva ser específico, basta adicionar os já citados
    //width e height

    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: 0, vertical: deviceHeight * 0.2),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.purple[800],
            border: Border.all(width: 2.5, color: Colors.amber)),
        child: Column(
          children: [
            Text(
              widget.texto,
              style: TextStyle(
                  color: Colors.amber[600], fontWeight: FontWeight.bold),
            ),
            Text(
              widget.textoParam,
              style: TextStyle(
                  color: Colors.amber[600], fontWeight: FontWeight.w300),
            ),
            //Teste básico pra ver as dimensões da tela
            Text(
              'Largura :: ${deviceWidth.toInt().toString()} \n  Altura :: ${deviceHeight.toInt().toString()}',
              style: TextStyle(
                  color: Colors.amber[600], fontWeight: FontWeight.w300),
            )
          ],
        ));
  }
}
