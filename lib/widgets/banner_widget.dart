import 'package:flutter/material.dart';

//Teste de Widget Stateless, os outros dois
//foram Statefull
class BannerWidget extends StatelessWidget {
  final String bannerText;

  const BannerWidget({super.key, required this.bannerText});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0XFFBDB76B),
            border: Border.all(color: const Color(0xFF8B795E), width: 2.5)),
        child: Text(bannerText));
  }
}
