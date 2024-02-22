import 'package:flutter/material.dart';
import 'package:recriando_projeto_padrao/app_images.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.digimonSrc1,
          height: 100,
        ),
        Image.asset(
          AppImages.pokemonSrc1,
          height: 100,
        ),
      ],
    );
  }
}
