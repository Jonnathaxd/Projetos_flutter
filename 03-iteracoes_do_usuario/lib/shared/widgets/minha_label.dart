import 'package:flutter/material.dart';

class MinhaLabel extends StatelessWidget {
  final String meuTexto;
  const MinhaLabel({super.key, required this.meuTexto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Text(meuTexto,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }
}
