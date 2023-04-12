import 'dart:math';
import 'package:flutter/material.dart';

//Sobre ::
//Este widget vai conter uma lista de consoles
//e de forma randomica vai escolher um dos mesmos.

//Deve ser um container que contém uma imagem, um
//texto e um botão. Tudo em ordem de coluna

//A imagem é a de um dado, e deve conter uma animação
//de rodar enquanto sorteia o console

//--------------------------------------------

//  To-do ::
// - Testar a randomização dos consoles
// - Adicionar mais consoles
// - Adicionar a imagem do dado
// - Adicionar uma animação de rolagem

enum Consoles {
  nintendo,
  superNintendo,
  nintendo64,
  gameBoy,
  gameBoyColor,
  gameBoyAdvance,
  sg1000,
  masterSystem,
  megaDrive,
  gameGear,
  dreamcast
}

class SelectConsole extends StatefulWidget {
  final String btnText = 'Sortear';
  const SelectConsole({super.key});

  @override
  State<SelectConsole> createState() => _SelectConsole();
}

class _SelectConsole extends State<SelectConsole> {
  int enumSize = Consoles.values.length;
  String _consoleText = 'Sorteie um console';

  void _changeConsoleText() {
    setState(() {
      _consoleText = Consoles.values.elementAt(Random().nextInt(enumSize)).name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double devWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: devWidth * 0.25),
        child: Column(
          children: [
            Text(_consoleText),
            ElevatedButton(
                onPressed: _changeConsoleText,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[800]),
                child: Text(
                  widget.btnText,
                  style: const TextStyle(color: Colors.white),
                ))
          ],
        ));
  }
}
