import 'package:flutter/material.dart';
import 'package:recriando_projeto_padrao/pages/login_page_versao2.dart';
import 'package:recriando_projeto_padrao/pages/pagina_cadastro.dart';

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // lembre-se que o ink é para ações genéricas
        // com efeito padrão no click...
        UserAccountsDrawerHeader(
          // imagem que posso colocar...
          currentAccountPicture: CircleAvatar(
            child: Image.network(
                "https://hermes.dio.me/companies/a169bb67-5f72-4289-9778-fcea58dfa19a.png"),
          ),
          // nome da conta
          accountName: const Text("Geova Jonnatha"),
          // email da conta...
          accountEmail: const Text("Geova@hotmail.com"),
        ),
        InkWell(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 8,
                ),
                Text("Dados cadastrais"),
              ],
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaginaCadastro(
                  tituloCustomizado: "Dados cadastrais",
                ),
              ),
            );
          },
        ),
        // isso daqui é aquelas linhas de divisão..
        const Divider(),
        // lembre-se que o ink é para ações genéricas
        // com efeito padrão no click...
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext ctx) {
                  // foi utilizado o wrap no lguar do
                  // Column porque nesse caso eu quero
                  // que ele ocupe apenas o tamanhos que os ítens
                  // de fato ocupam...
                  return const Wrap(
                    children: [
                      // o listTitle é uma row com uma
                      // estilização já específica que nos ajda

                      ListTile(
                        title: Text("Camera"),
                        leading: Icon(Icons.camera),
                      ),
                      ListTile(
                        title: Text("Album"),
                        leading: Icon(Icons.photo_album),
                      ),
                    ],
                  );
                });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.info),
                SizedBox(
                  width: 8,
                ),
                Text("Termos de privacidade..."),
              ],
            ),
          ),
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            // função para mostrar um dialog...
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Tem certeza ?"),
                    // lembre-se que o wrap é utilizado
                    // no lugar do column para que ele não
                    // oculpe a coluna inteira...
                    content: const Wrap(
                      children: [
                        Text("A confirmação irá deslogar sua conta..."),
                        Text("Segunda linha de conteúdo...")
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Não"),
                        onPressed: () {
                          // Fecho a página atual... no caso o dialog...
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: const Text("Sim"),
                        onPressed: () {
                          // lembre-se que esse pushReplacemente muda a página apagando a pilha de páginas...
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext bc) {
                            return const LoginPage();
                          }));
                        },
                      )
                    ],
                  );
                });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: const Row(children: [
              Icon(Icons.exit_to_app),
              SizedBox(
                width: 8,
              ),
              Text("Sair")
            ]),
          ),
        )
      ]),
    );
  }
}
