import 'dart:convert';

int calculate() {
  return 6 * 7;
}

double calcularDesconto(double valor, double desconto, bool percentual) {
  // caso eu passe um valor menor que zero eu disparo um erro...
  if (valor <= 0) {
    throw ArgumentError("O valor do produto não pode ser zero...");
  }

  if (desconto <= 0) {
    throw ArgumentError("O valor do desconto não pode ser zero");
  }

  if (percentual) {
    return valor - ((valor * desconto) / 100);
  } else {
    return valor - desconto;
  }
}
