import 'dart:convert';

import 'package:http/http.dart' as http;

class ViaCep {
// esse future foi necessário
// porque estamos lidando com uma função asincrona
// funciona parecido com as promises...
  Future<Map<dynamic, dynamic>> retornaCep(String cep) async {
    // diferente do js que usamos o fetch pasano a string direto
    // aqui utilizamos um objeto para envio para as rotas...
    var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");

    var retorno = await http.get(uri);
    // o retorno não é um map, mas sim um json...
    // por isos precisamos fazer uma conversão
    var decodeResponse = jsonDecode(utf8.decode(retorno.bodyBytes)) as Map;
    print(decodeResponse);

    return decodeResponse;
  }
}
