import 'package:flutter/material.dart';

class MetodoParam extends StatefulWidget {
  final String title;

  //Quando nosso método espera
  final Function(String x) pressedMethod;

  const MetodoParam(
      {super.key, required this.title, required this.pressedMethod});

  @override
  State<MetodoParam> createState() => _MetodoParam();
}

class _MetodoParam extends State<MetodoParam> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.pressedMethod,
      style:
          ElevatedButton.styleFrom(disabledBackgroundColor: Colors.teal[400]),
      child: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
