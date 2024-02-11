import 'package:primeiro_projeto/primeiro_projeto.dart' as primeiro_projeto;

void main(List<String> arguments) {
//   // Maneiras de inicializar variáveis...
//   String name = "Pedro";
//   var name2 = "Pedro";
//   String name3;
//   late String name4;
//   final String name5;

//   int numero1 = 1;
//   var numero2 = 2;
//   int numero3;
//   late String numero4;
//   final String numero5;

//   List<String> lista = [];
//   lista.add("Primeiro texto");
//   // nesse caso aqui a lista é dinamica
//   // ou seja aceita qualquer coisa...
//   var lista2 = [];
//   lista2.add("Oi");
//   lista2.add(2);
//   lista2.add(true);

//   // print('Hello world: ${primeiro_projeto.calculate()}!');

//   int numero1TesteEven = 10;
//   var numero2TesteEven = 11;
//   print("Mostra true se for par: ");

//   print(numero1TesteEven.isEven);
//   print(numero2TesteEven.isEven);

//   print("Mostra true se for impar: ");
//   print(numero1TesteEven.isOdd);
//   print(numero2TesteEven.isOdd);

//   print("retorna se for finito");
//   print(numero1.isFinite);

//   print("número infinito");
//   print(numero1.isInfinite);

// //  um número infinito pode ser:
//   print(double.infinity);
//   print(double.infinity.isInfinite);

//   print("verifica se não é um número válido:");
//   print(numero1.isNaN);

//   print("verifica se é um número negativo");
//   print(numero1.isNegative);
//   print((numero1 * -1).isNegative);

//   // conversão de dados:
//   print(int.parse("99"));
//   // esse daria erro porque não é inteiro...
//   // print(int.parse("teste"));
//   // esse é usado para quando o parte dê érro ele retornar null...
//   print(int.tryParse("teste"));

  // var numero1 = 10.1;
  // double numero2 = 11.1;

  // print("Remove o ponto flutuante");
  // print(numero1.truncate());

  // print("converte para inteiro");
  // print(numero1.toInt());

  // print("arredonda para cima");
  // print(numero1.ceil());
  // print(numero2.ceil());

  // print("arredonda pra baixo");
  // print(numero1.floor());
  // print(numero2.floor());

  // print("Retorna se é infinito...");
  // print(numero1.isInfinite);

  // print("retorna se ele é finito");
  // print(numero1.isFinite);

  // print("retorna se ele é invalido ou não");
  // print(numero1.isNaN);

  // print("retorna se ele é negativo");
  // print(numero1.isNegative);

  // print("converte para double...");
  // print(double.parse("2"));
  // // daria erro...
  // // print(double.parse("teste"));
  // // retorna null caso dê erro...
  // print(double.tryParse("teste"));

//   String texto1 = "Dio";
//   var texto2 = "Trilha de flutter e dart na BIO";

// // verifica se é string vazia...
//   print(texto2.isEmpty);
//   print("".isEmpty);
//   print(" ".isEmpty);

//   // o tamanho da string
//   print(texto2.length);

//   // transforma em maiúscula, e transforma em minúscula..
//   print(texto2.toLowerCase());
//   print(texto2.toUpperCase());

//   // verifica se determinado termo existe na string...
//   // pode ser utilizado com regex...
//   print(texto2.contains("dart"));

//   // cortando a string.. do indice 5 até o fim...
//   print(texto2.substring(5));
//   // pegando a string do indice 5 até o 17...
//   print(texto2.substring(5, 17));

//   // pega a posiçao que começa determinado termo...
//   print(texto2.indexOf("flutter"));
//   // caso não exista retorna -1
//   print(texto2.indexOf("@"));

//   // substitui termos por outros...
//   // ele não altera a string original...
//   print(texto2.replaceAll("a", "@"));

//   // qubera a string transformando em um array baseado em algum termo...
//   print(texto2.split("a"));

//   // remove espaçamentos...
//   print(" dio ".trim());
//   print(" dio ".trimLeft());
//   print(" dio ".trimRight());

  // var varTrue = true;
  // bool varFalse = false;
  // // podemos fazer asism para que ele subentenda que é flase...
  // bool varFalse2;

  // print(varTrue);
  // print(varFalse);
  // print(varFalse == varTrue);
  // print(varFalse == !varTrue);

  // brincando com listas...
  // List<String> lstString = [];
  // var lstInt = [1, 10, 12];
  // List lstDynamic = [];

  // print("Tamanho da lista");
  // print(lstString.length);
  // print(lstInt.length);
  // print(lstDynamic.length);

  // // adicionado item na lista...
  // lstString.add("M");
  // lstString.add("B");
  // lstInt.add(5);
  // lstDynamic.add("M");
  // lstDynamic.add(5);
  // lstDynamic.add(true);

  // print(lstString);
  // print(lstInt);
  // print(lstDynamic);

  // // verifica se a lista tem tamanho...
  // print(lstString.isEmpty);
  // // verifica se a lista não tem tamanho...
  // print(lstString.isNotEmpty);

  // // se há um determinado valor na lista...
  // print(lstDynamic.contains(5));

  // // where... o where funciona parecido com o filter do js...
  // print(lstInt.where((element) => element >= 5));

// brincando com mapas...
  // Map<String, dynamic> map1 = <String, dynamic>{};
  // var map = {"zero": 0, "one": 1, "two": 2};

  // print(map1);
  // print(map);

  // print("Pegar o valor pela chave");
  // print(map["one"]);

  // // adicionando vários valores ao map:
  // map.addAll({"ten": 10, "eleven": 11});
  // print(map);

  // print("se está vazio...");
  // print(map.isNotEmpty);
  // print(map1.isEmpty);

  // print("contem valores ?");
  // // contem certa chave ?
  // print(map.containsKey("ten"));
  // print(map.containsValue(11));

  // criando constante...
  // const String meuPiComoString = "3.14";

  // criando dinamics...
  // dynamic var1 = "ABC";
  // var1 = 5;
  // var1 = ["teste"];
  // var1 = true;

  // Brincando com datas...
  DateTime data1 = DateTime.now();
  var data2 = DateTime.parse("2024-02-01 00:00:00");
  // pode ser utilizado o try parse porém para uma variável mais dinamica...
  // porque pode ser retornado null
  // data1 = DateTime.tryParse("2024-02-01 00:00:00");

  print(data1);

  // dia
  print(data1.day);
  print(data1.month);
  print(data1.year);
  print(data1.hour);
  print(data1.minute);
  print(data1.second);
  print(data1.millisecond);
  print(data1.microsecond);

  print("Dia da semana...");
  print(data1.weekday);

  print("Soma de datas");
  print(data1.add(Duration(days: 1)));
  print(data1.subtract(Duration(days: 365)));

  // comparando datas...

  print(data1.isAfter(data2));
  print(data1.isBefore(data2));
  // a comparação retorna negativo se a data for antes
  // 0 se a data for igual e positivo se a data for depois...
  print(data1.compareTo(data2));
}
