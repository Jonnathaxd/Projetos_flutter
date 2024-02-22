import 'package:recriando_projeto_padrao/model/card_detail.dart';

class CardDetailsRepository {
  // vej que o retorno é um future, funciona como as promiseses...
  Future<CardDetail> getAllData() async {
    // isso daqui é pra deixar a função como asyncrona de maneira fake...
    await Future.delayed(const Duration(seconds: 5));

    // com a linha acima com await, ele só prossiguirá quando o delay encerrar...
    return CardDetail(
        id: 1,
        title: "Titulo da card...",
        paragraphText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        urlImage:
            "https://hermes.dio.me/companies/a169bb67-5f72-4289-9778-fcea58dfa19a.png");
  }
}
