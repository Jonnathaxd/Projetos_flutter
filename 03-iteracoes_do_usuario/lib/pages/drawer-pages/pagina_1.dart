import 'package:flutter/material.dart';
import 'package:recriando_projeto_padrao/model/card_detail.dart';
import 'package:recriando_projeto_padrao/pages/drawer-pages/hero_page_1.dart';
import 'package:recriando_projeto_padrao/repositories/card_details_repository.dart';

// transfomei em stateless...
class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  var cardDetailsRepository = CardDetailsRepository();

  // usei o model que eu criei para compartilhar os dados com o mesmo
  CardDetail? _cardDetailData;

  @override
  void initState() {
    // aqui no initState não podemos usar async await... porque ele
    // sempre espera void... por isso criamos uma função por fora...
    pegarDadosDoCard();
  }

  Future<void> pegarDadosDoCard() async {
    _cardDetailData = await cardDetailsRepository.getAllData();
    // eu não coloquei a função dentro por causa do mesmo caso que
    // o initialState, essa função espera um retorno void..
    // colocar um async nela seria errado...
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // aqui eu retorno o conteúdo principal apenas se tiver
    return _cardDetailData == null
        ? Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const LinearProgressIndicator()))
        : InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext bc) {
                  return HeroPage(
                    // passo os dados para o outro widget...
                    cardDetailData: _cardDetailData,
                  );
                },
              ));
            },
            child: Hero(
              // perceba que o id deve ser o mesmo...
              // colocar a exclamação significa que eu estou
              // forçando o código a entender o objeto não é nulo
              // e que vai ter sim um id...
              tag: _cardDetailData!.id,
              child: Container(
                color: Colors.blue,
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    color: Colors.grey,
                    child: Card(
                      // o elevation funciona como o box-shadow...
                      elevation: 16,
                      // a cor desse shadow...
                      shadowColor: Colors.purple,

                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  height: 40,
                                  _cardDetailData!.urlImage,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(_cardDetailData!.title,
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                _cardDetailData!.paragraphText,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
  }
}
