import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recriando_projeto_padrao/services/gerador_numeros_aleatorios_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroAleatorio = 0;
  var quantidadeDeCliques = 0;

  gerarNovoNumero() {
    // isso forçará que o componente seja renderizado novamente
    setState(() {
      numeroAleatorio = GeradorNumerosAleatoriosService.gerarNovoNumero(99);
      quantidadeDeCliques += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // o Container funciona parecido com a div na web
    // já o scafold funciona como um esqueleto padrão que
    // nos permite seguir certoa padrões com elementos comuns
    // como appBar drawer e etc...
    return Scaffold(
      // por padrão esse appbar é o headerzinho do app
      appBar: AppBar(
        // aqui eu passo um widget para passar o texto
        title: Text(
          "hello world",
          style: GoogleFonts.ubuntu(),
        ),
        // aqui eu altero a cor de fundo desse app bar
        backgroundColor: Colors.blue,
        // nas versões anteriores o shadow e a cor
        // já vinham por padrão... mas agora não vem
        // precisei desses aqui embaixo para fazer
        // algo do tipo...
        elevation: 5,
        shadowColor: Colors.deepOrange,
      ),
      body: Container(
        // quando estamos lidando com container o color n tem
        // relação com a cor do texto, mas sim do background...
        color: Colors.deepPurple,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        // faz com que ele ocupe toda largura disponível
        width: double.infinity,

        child: Column(
          // alinhamento horizontal
          mainAxisAlignment: MainAxisAlignment.start,
          // alinhamento vertical...
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Text("A quantidade de clicks foi $quantidadeDeCliques"),
            ),
            Text("Meu número atual é ${numeroAleatorio.toString()}"
                // style: GoogleFonts.ubuntu(fontSize: 64)
                ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.indigo,
                    child: const Text("Teste1"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    child: const Text(
                      "Teste2",
                      // cor....
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      // botão que fica flutuando...
      // perceba que o valor que passei foi um construtor
      // padrão também...
      floatingActionButton: FloatingActionButton(
        // esse onpressed é algo obrigatório..
        // funciona como onclick...
        onPressed: () {
          gerarNovoNumero();
        },
        // adicionaod um icone
        child: const Icon(Icons.developer_mode_sharp),
      ),
    );
  }
}
