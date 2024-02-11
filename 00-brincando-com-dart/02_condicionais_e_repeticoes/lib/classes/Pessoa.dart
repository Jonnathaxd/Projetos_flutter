class Pessoa {
  late String _name;
  late final int _age;

  int get age {
    return _age;
  }

// essa é a maneira correta de fazer um getter.
  String get name {
    return _name;
  }

// essa é a maneira correta de fazer um setter...
  set name(String newValue) {
    if (newValue.toLowerCase() == "pedro") {
      print("Valor não aceito, tente novamnete...");
    } else {
      _name = newValue;
    }
  }

  // Pessoa(this._name, this._age);
  // pode ser escrito assim o construtor...
  Pessoa(String name, int age) {
    _name = name;
    _age = age;
  }

  // por padrão temos algo do tipo:
  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return super.toString();
  // }

// as classes de padrão sobrescrevem ma classe chamada object...
  // vamos sobrescrever..
  @override
  String toString() {
    // o retorno deve ser uma string
    // por isso precisamos transformar o map em string;
    return {
      "name": _name,
      "age": _age,
    }.toString();
  }
}
