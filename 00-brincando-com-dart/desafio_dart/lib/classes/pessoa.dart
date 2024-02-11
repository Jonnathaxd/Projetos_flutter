class Pessoa {
  late String _nome;
  late double _peso;
  late double _altura;

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;

  @override
  String toString() {
    return {"nome": _nome, "peso": _peso, "altura": _altura}.toString();
  }
}
