import 'package:segundo_projeto/classes/Pessoa.dart';

class PessoaJuridica extends Pessoa {
  late String _cnpj;

  String get cnpj => _cnpj;

  PessoaJuridica(String name, int age, String cnpj) : super(name, age) {
    _cnpj = cnpj;
  }

  @override
  String toString() {
    // TODO: implement toString
    return {
      "name": name,
      "age": age,
      "cnpj": cnpj,
    }.toString();
  }
}
