import 'package:flutter/material.dart';
import 'package:recriando_projeto_padrao/pages/pagina_cadastro.dart';

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
      drawer: Drawer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // lembre-se que o ink é para ações genéricas
          // com efeito padrão no click...
          InkWell(
            onTap: () {
              print("cliquei na opção 1r");
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaginaCadastro(
                    tituloCustomizado: "Meu texto customizado",
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: const Text("Opção 1"),
            ),
          ),
          // isso daqui é aquelas linhas de divisão..
          const Divider(),
          // lembre-se que o ink é para ações genéricas
          // com efeito padrão no click...
          InkWell(
            onTap: () {
              print("cliquei na opção 2");
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: const Text("Opção 2"),
            ),
          ),
        ]),
      ),
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
          Container(
            color: Colors.blueAccent,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.orange,
          ),
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
