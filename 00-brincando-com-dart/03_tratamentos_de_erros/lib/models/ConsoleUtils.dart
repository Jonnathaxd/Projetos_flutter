import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerStringComTexto(String texto) {
    print(texto);
    return lerString();
  }

  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble() {
    var value = lerString();

    try {
      return double.parse(value);
    } catch (err) {
      return null;
    }
  }

  static lerDoubleComTexto(String texto) {
    print(texto);

    return lerDouble();
  }

  static lerDoubleComTextoESaida(String texto, String saida) {
    while (true) {
      try {
        String value = lerStringComTexto(texto);

        if (value.toLowerCase() == saida) {
          return null;
        }

        return double.parse(value);
      } catch (err) {
        print("Valor inválido tente novamente");
      }
    }
  }
}
