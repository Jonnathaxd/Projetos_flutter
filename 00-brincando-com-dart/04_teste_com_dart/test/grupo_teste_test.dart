import 'package:teste_com_dart/teste_com_dart.dart' as app;
import 'package:test/test.dart';

void main() {
  // crio uma descrição do grupo
  group("Calcula o valor do produto com desconto: ", () {
    // aqui é um map de maps, onde a chave dele são as entradas
    // e o valor sua saida...
    var valuesToTest = {
      {"valor": 1000, "desconto": 150, "percentual": false}: 850,
      {"valor": 1000, "desconto": 15, "percentual": true}: 850,
      {"valor": 1000, "desconto": 1, "percentual": true}: 850
    };
    // veja que é um map já pensando em cada caso que deve ser verificado...

// veja que o forEach consegue itera por maps
// retornando seu valor e sua chave...
// perceba que dentro dele que eu utilizo o "test"
    valuesToTest.forEach((values, expected) {
      // veja que eu uso o test passando como descrição os valores...
      // não é obrigatório...
      test("$values:$expected", () {
        // passo sempre esse expect...
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group("Grupo de testes esperando erro... ", () {
    var valuesToTest = {
      {"valor": 0, "desconto": 150, "percentual": false}:
          throwsA(TypeMatcher<ArgumentError>()),
      {"valor": 100, "desconto": 0, "percentual": true}:
          throwsA(TypeMatcher<ArgumentError>()),
    };

    valuesToTest.forEach((values, expected) => test("$values:$expected", () {
          expect(
              () => app.calcularDesconto(
                  double.parse(values["valor"].toString()),
                  double.parse(values["desconto"].toString()),
                  values["percentual"] == true),
              expected);
        }));
  });
}
