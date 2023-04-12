import 'package:flutter/material.dart';

class DesafioElevated extends StatefulWidget {
  final String title;
  //Não nos importa a lógica do método recebido
  //nosso objetivo é o simples disparo do mesmo
  //quando o onPressed ocorre.
  final void Function() pressedMethod;

  const DesafioElevated(
      {super.key, required this.title, required this.pressedMethod});

  @override
  State<DesafioElevated> createState() => _DesafioElevated();
}

class _DesafioElevated extends State<DesafioElevated> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.pressedMethod,
      style:
          ElevatedButton.styleFrom(disabledBackgroundColor: Colors.teal[400]),
      child: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
