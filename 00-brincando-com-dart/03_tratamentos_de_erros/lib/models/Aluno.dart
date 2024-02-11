class Aluno {
  late String _name;
  late final List<double> _grades = [];

  Aluno(String name) {
    _name = name;
  }

  String get name => _name;

  set name(String newValue) {
    _name = newValue;
  }

  List<double> get grades => _grades;

  void addGrade(double grade) {
    _grades.add(grade);
  }

  String retornaMedia() {
    if (_grades.isEmpty) {
      return 0.toStringAsFixed(2);
    }

    var valorDaSomaDasNotas =
        _grades.reduce((acumulador, currentValue) => acumulador + currentValue);

    return (valorDaSomaDasNotas / grades.length).toStringAsFixed(2);
  }

  @override
  String toString() {
    return {
      "name": name,
      "grades": grades,
    }.toString();
  }
}
