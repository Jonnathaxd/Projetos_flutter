import 'package:flutter/material.dart';
import 'package:recriando_projeto_padrao/repositories/linguagens_repository.dart';
import 'package:recriando_projeto_padrao/repositories/nivel_repository.dart';
import 'package:recriando_projeto_padrao/shared/widgets/minha_label.dart';

class PaginaCadastro extends StatefulWidget {
  final String tituloCustomizado;

  const PaginaCadastro({super.key, required this.tituloCustomizado});

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final TextEditingController nomeInputController =
      TextEditingController(text: "");
  var dataInputController = TextEditingController();
  var _niveis = [];
  var _linguagens = [];
  // variável para identificar o valor do checkbox selecionado...
  String _checkboxValue = "";
  final List<String> _linguagensSelecionadas = [];
  double _salarioEscolhido = 0;
  late int _anosExperienciaSelecionado = 0;
  bool salvando = false;

  List<DropdownMenuItem<int>> retornaDropdownItems(int quantidadeMaxima) {
    List<DropdownMenuItem<int>> myList = [];

    for (var i = 0; i < quantidadeMaxima; i++) {
      myList.add(
        DropdownMenuItem(
          value: i,
          child: Text(
            "Valor: $i",
          ),
        ),
      );
    }

    return myList;
  }

  @override
  void initState() {
    // aqui é o método de vida do widget
    // quando onde configuramos valores inicias...
    _niveis = NivelRepository.retornaNiveis();
    _linguagens = LinguagensRepository.retornaLinguagens();
    super.initState();
  }

  // maneira de criar um "componente" de maneira interna...
  // Text textoFormatado(String meuTexto){
  //   return Text(meuTexto, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // veja como foi pego o valor do título quando converti para statefull...
        title: Text(widget.tituloCustomizado),
        backgroundColor: Colors.blueGrey,
        elevation: double.infinity,
      ),
      body: salvando
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: ListView(children: [
                const MinhaLabel(meuTexto: "Nome"),
                TextField(
                  controller: nomeInputController,
                ),
                const MinhaLabel(meuTexto: "Data de nascimento"),

                // colocamos esse textField apenas para leitura
                // pois ele servirar como "suporte para o resultado"
                TextField(
                  controller: dataInputController,
                  readOnly: true,
                  // veja que é um retorno de future
                  // por isso torna-se necessário o uso do async
                  // await...
                  onTap: () async {
                    // aqui é onde eu abro o modalzin de datas...
                    var data = await showDatePicker(
                      context: context,
                      // valor inicial pre selecionado...
                      initialDate: DateTime.now(),
                      // data inicial minima máximo que pode ser selecionada
                      firstDate: DateTime(1600, 1, 1),
                      // data máxima que pode ser selecionada...
                      lastDate: DateTime.now(),
                    );
                    // o valor pode ser nulo, então só adiciono a data formatada
                    // quando não for nulo...
                    if (data != null) {
                      dataInputController.text =
                          "${data.day}/${data.month}/${data.year}";
                    }
                  },
                ),
                const MinhaLabel(meuTexto: "Nível de experiência"),

                Column(
                  // lembre-se que o children recebe um array de elementos...
                  children: _niveis
                      .map(
                        (currentNivelValue) => RadioListTile(
                          // veja que eu utilizo esse toString
                          // porque os valores vindos do map são dynamic
                          value: currentNivelValue.toString(),
                          title: Text(currentNivelValue.toString()),
                          groupValue: _checkboxValue,
                          // boleano para saber se está
                          // ou não selecionado...
                          selected:
                              _checkboxValue == currentNivelValue.toString(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                // utilizo isso para repintar o elemento...
                                _checkboxValue = value;
                              });
                              print(value);
                            }
                          },
                        ),
                        // atenção, o retorno do map é um Iterable e não uma lista..
                        // por isso preciso desse toList abaixo...
                      )
                      .toList(),
                ),
                const MinhaLabel(meuTexto: "Linguagens"),
                Column(
                  children: _linguagens
                      .map(
                        (linguagem) => CheckboxListTile(
                          title: Text(linguagem.toString()),
                          value: _linguagensSelecionadas.contains(linguagem),
                          onChanged: (valor) {
                            //  if(valor!): Esta é uma condição if. valor! é uma expressão que significa "se o valor não for nulo". O operador ! (ponto de exclamação) é usado para dizer ao Dart que você está ciente de que o valor pode ser nulo, mas você tem certeza de que não será nulo neste ponto do código. Então, o if verifica se o valor não é nulo antes de executar o restante do código dentro do bloco if.
                            if (valor!) {
                              setState(() {
                                // aqui eu adiciono a linguagem na lista...
                                _linguagensSelecionadas.add(linguagem);
                              });
                            } else {
                              setState(() {
                                // aqui eu removo a linguagem da lista...
                                _linguagensSelecionadas.remove(linguagem);
                              });
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
                const MinhaLabel(meuTexto: "Tempo de experiência..."),
                DropdownButton(
                    // valor atual do dropdownButton...
                    value: _anosExperienciaSelecionado,
                    // aqui é para que a setinha do dropdown fique no extremo
                    // do canto direito...
                    isExpanded: true,
                    // items: const [
                    //   DropdownMenuItem(
                    //     value: 0,
                    //     child: Text(
                    //       "Valor 1",
                    //     ),
                    //   ),
                    //   DropdownMenuItem(
                    //     value: 1,
                    //     child: Text(
                    //       "Valor 2",
                    //     ),
                    //   ),
                    // ],
                    items: retornaDropdownItems(20),
                    onChanged: (value) {
                      setState(() {
                        _anosExperienciaSelecionado =
                            int.tryParse(value.toString()) ?? 0;
                      });
                      //
                    }),

                MinhaLabel(
                    meuTexto:
                        "Pretenção salarial R\$ ${_salarioEscolhido.round()}"),
                Slider(
                  // valor inicial...
                  min: 0,
                  // valor máximo...
                  max: 10000,
                  // valor atual...
                  value: _salarioEscolhido,
                  onChanged: (value) {
                    setState(() {
                      _salarioEscolhido = value;
                    });
                  },
                ),
                TextButton(
                    onPressed: () {
                      print(nomeInputController.text);

                      setState(() {
                        salvando = true;
                      });

                      Future.delayed(const Duration(seconds: 5), () {
                        setState(() {
                          salvando = false;
                        });
                      });
                    },
                    child: const Text("Salvar"))
              ]),
            ),
    );
  }
}
