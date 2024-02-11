import 'dart:convert';
import 'dart:io';

import 'package:segundo_projeto/classes/Pessoa.dart';
import 'package:segundo_projeto/classes/PessoaJuridica.dart';
import 'package:segundo_projeto/segundo_projeto.dart' as segundo_projeto;

void main(List<String> arguments) {
  // print("Informe a primeira nota: ");
  // var nota1 = double.tryParse(stdin.readLineSync(encoding: utf8) ?? "0") ?? 0;
  // print("Informe a segunda nota: ");
  // var nota2 = double.tryParse(stdin.readLineSync(encoding: utf8) ?? "0") ?? 0;

  // var media = ((nota1 + nota2) / 2).toStringAsFixed(2);
  // print("A média é: $media");

  // falarNome(
  //   "Pedro",
  // );
  var pessoa = Pessoa("Joao", 5);
  print(pessoa);
  pessoa.name = "pedro";
  pessoa.name = "Jonnatha";
  print(pessoa.name);

  var pj = PessoaJuridica("Carlos", 52, "223423");
  print(pj);
}

// void falarNome(String firstName, {String? lastName = "padrao"}) {
//   print("Meu nome é $firstName");
//   print("Meu sobrenome é $lastName");
// }
