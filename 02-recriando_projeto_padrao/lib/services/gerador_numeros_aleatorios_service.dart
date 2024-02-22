import 'dart:math';

class GeradorNumerosAleatoriosService {
  static int gerarNovoNumero(int numeroMaximo) {
    return Random().nextInt(numeroMaximo);
  }
}
