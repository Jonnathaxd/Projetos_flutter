import 'package:flutter/material.dart';
import 'package:recriando_projeto_padrao/model/card_detail.dart';

class HeroPage extends StatelessWidget {
  // aqui eu pego os dados
  late final CardDetail _cardDetailData;
  HeroPage({
    super.key,
    // veja que coloquei um required para ser obrigatório passar
    required cardDetailData,
  }) {
    // aqui como eu quis que o cardDetail fosse privado
    // tive que passar aqui nos construtores...
    // normalmente ficaria this._cardDetailData direto nos {} do contrutror...
    _cardDetailData = cardDetailData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
      // veja que o hero recebe um id...
      // tem que ser o mesmo id do elemento que
      // está "casando" com ele...
      tag: _cardDetailData.id,
      // esse material é para evitar problemas na estilização
      // dos elementos enquanto ocorre a animação, seja fonte cor e etc..
      child: Material(
        child: Container(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Wrap(
              children: [
                Image.network(
                  _cardDetailData.urlImage,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    _cardDetailData.title,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    _cardDetailData.paragraphText,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
