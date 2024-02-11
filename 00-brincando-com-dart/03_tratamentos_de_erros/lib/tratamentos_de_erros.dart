import 'dart:convert';
import 'dart:io';

import 'package:tratamentos_de_erros/exeptions/nome_invalido_exeption.dart';
import 'package:tratamentos_de_erros/models/Aluno.dart';
import 'package:tratamentos_de_erros/models/ConsoleUtils.dart';

void execute() {
  print("Bem vindo ao sistema de notas!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno: ");
  // aqui tem a exessão personalizada...
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoExeption();
    }
    throw Exception("outro erro");
  } on NomeInvalidoExeption {
    print("O erro específoc foi NomeInvalidoExeption");
  } catch (e) {
    print("O erro específoc foi outro");
  }

  var aluno = Aluno(nome);

  while (true) {
    var nota = ConsoleUtils.lerDoubleComTextoESaida(
        "Digite uma nota ou 'S' para sair", 's');

    if (nota == null) {
      break;
    }

    aluno.addGrade(nota);
  }

  print(aluno.retornaMedia());
}
