import 'package:flutter/material.dart';

class PaginaCadastro extends StatelessWidget {
  late String tituloCustomizado;
  // os valores passados aí serão os requisitados no momento de
  // caminhar entre rotas..
  PaginaCadastro({super.key, required this.tituloCustomizado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloCustomizado),
      ),
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Retorno aqui embaixo: "),
      ]),
    );
  }
}
