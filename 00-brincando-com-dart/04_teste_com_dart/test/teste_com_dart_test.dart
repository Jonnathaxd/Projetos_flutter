import 'package:mockito/mockito.dart';
import 'package:teste_com_dart/classes/viacep.dart';
import 'package:teste_com_dart/teste_com_dart.dart' as app;
import 'package:test/test.dart';

import 'arquivo_para_criacao_do_mock.mocks.dart';

void main() {
  test('calculate', () {
    // aqui eu espero que o retorno de
    // calculate seja exaamente 42
    expect(app.calculate(), 42);
  });
  test('calculate2', () {
    // aqui eu espero que o retorno de
    // calculate seja maior que 42
    expect(app.calculate(), greaterThan(42));
  });
  test('Calcula o valor do produto. desconto do produto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });
  test('Calcula o valor do produto. desconto do produto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });
  test(
      'Calcula o valor do produto. desconto do produto sem  porcentagem passando o valor zerado...',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });
  test(
      'Calcula o valor do produto. desconto do produto com  porcentagem passando o valor zerado...',
      () {
    expect(() => app.calcularDesconto(1000, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });
  test("Retornar cep", () async {
    ViaCep viaCep = ViaCep();
    var retorno = await viaCep.retornaCep("57010728");
    // aqui eu vejo o map retornado...
    expect(retorno["localidade"], equalsIgnoringCase("maceió"));
    // veja que podemos fazer mais de um expected em um teste...
    expect(retorno["bairro"], equalsIgnoringCase("Trapiche da Barra"));
  });

  test("Retornar cep com dados fakes do mock", () async {
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();

    when(mockMockViaCEP.retornaCep("57010728"))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "57010-728",
              "logradouro": "Rua José Leopoldino de Oliveira",
              "complemento": "de 288/289 ao fim",
              "bairro": "Trapiche da Barra",
              "localidade": "Maceió",
              "uf": "AL",
              "ibge": "2704302",
              "gia": "",
              "ddd": "82",
              "siafi": "2785"
            }));

    var retorno = await mockMockViaCEP.retornaCep("57010728");
    // aqui eu vejo o map retornado...
    expect(retorno["localidade"], equalsIgnoringCase("maceió"));
    // veja que podemos fazer mais de um expected em um teste...
    expect(retorno["bairro"], equalsIgnoringCase("Trapiche da Barra"));
  });
}
