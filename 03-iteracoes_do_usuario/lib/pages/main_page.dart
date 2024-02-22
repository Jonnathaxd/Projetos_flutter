import 'package:flutter/material.dart';
import 'package:recriando_projeto_padrao/pages/drawer-pages/pagina_1.dart';
import 'package:recriando_projeto_padrao/pages/drawer-pages/pagina_2.dart';
import 'package:recriando_projeto_padrao/pages/drawer-pages/pagina_3.dart';
import 'package:recriando_projeto_padrao/pages/pagina_cadastro.dart';
import 'package:recriando_projeto_padrao/shared/widgets/my_custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Hello wolrd"),
      ),
      drawer: const MyCustomDrawer(),
      body: PageView(
        pageSnapping: true,
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        // aqui é a direção que você quer que ocorra o scroll..
        scrollDirection: Axis.horizontal,
        children: [
          Pagina1(),
          const Pagina2(),
          const Pagina3(),
        ],
      ),
      // aqui é o rodapé de navegação...
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (value) {
            // aqui quando você clicar em qualquer ícone
            // ele pegará o seu valor, e alterará o controlador
            // para a página da vez...
            pageController.jumpToPage(value);
          },
          items: const [
            BottomNavigationBarItem(
              label: "pag1",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "pag2",
              icon: Icon(Icons.security_rounded),
            ),
            BottomNavigationBarItem(
              label: "pag3",
              icon: Icon(Icons.abc_sharp),
            ),
          ]),
    );
  }
}
