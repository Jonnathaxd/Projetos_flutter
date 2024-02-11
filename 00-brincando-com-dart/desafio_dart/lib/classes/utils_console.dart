import "dart:convert";
import "dart:io";

class UtilsConsole {
  static String pegarDadosDoConsole([String? mensagem]) {
    while (true) {
      if (mensagem != null) {
        print(mensagem);
      }

      var valorDoConsole = stdin.readLineSync(encoding: utf8) ?? "";

      if (valorDoConsole.isEmpty) {
        print("O valor não pode ser nulo...");
      } else {
        return valorDoConsole;
      }
    }
  }

  static double pegarDoubleDoConsole([String? mensagem]) {
    while (true) {
      var valorDoConsole = pegarDadosDoConsole(mensagem);

      var valorParseado = double.tryParse(valorDoConsole);

      if (valorParseado == null) {
        print("Valor inválido, tente novamente");
      } else {
        return valorParseado;
      }
    }
  }
}
