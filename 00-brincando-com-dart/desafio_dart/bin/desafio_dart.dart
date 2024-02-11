import 'package:desafio_dart/classes/Pessoa.dart';
import 'package:desafio_dart/classes/utils_console.dart';
import 'package:desafio_dart/desafio_dart.dart';

void main(List<String> arguments) {
  var nome = UtilsConsole.pegarDadosDoConsole("Digite seu nome: ");
  var peso = UtilsConsole.pegarDoubleDoConsole("Digite seu peso: ");
  var altura = UtilsConsole.pegarDoubleDoConsole("Digite sua altura: ");

  Pessoa pessoa = Pessoa(nome, peso, altura);

  var imc = calcularIMC(pessoa);
  var situacao = verificarIMC(imc);
  print("Olá $nome, seu imc atual é de ${imc.toStringAsFixed(2)}");

  print("Sua situação baseado no seu imc é: $situacao");
}
