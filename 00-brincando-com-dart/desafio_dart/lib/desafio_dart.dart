import 'dart:math';

import 'package:desafio_dart/classes/Pessoa.dart';

double calcularIMC(Pessoa pessoa) {
  // o imc é o peso / altura²
  var imc = pessoa.peso / pow(pessoa.altura, 2);

  return imc;
}

String verificarIMC(double imc) {
  if (imc < 17) {
    return "Magresa grave";
  } else if (imc >= 16 && imc < 17) {
    return "Magresa moderada";
  } else if (imc >= 17 && imc < 18.5) {
    return "Magresa leve";
  } else if (imc >= 18.5 && imc < 25) {
    return "Saudável";
  } else if (imc >= 25 && imc < 30) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    return "Obesidade Grau I";
  } else if (imc >= 35 && imc < 40) {
    return "Obesidade Grau II";
  } else if (imc >= 40) {
    return "Obesidade Grau III";
  }

  throw Exception("Imc enviado não é válido");
}
