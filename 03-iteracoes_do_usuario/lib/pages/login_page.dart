import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // formas de fazer cores...
        backgroundColor: Colors.white10,
        // a ideia é a mesma do rgba porém precisamos começar com 0x
        // backgroundColor: const Color(0xFF992255),
        // com rgba...
        // a ideia é a mesma que o css porém aqui ele inicia com a transparencia..
        // backgroundColor: const Color.fromARGB(50, 88, 99, 200),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(top: 100),
                color: Colors.orange,
                child: const Text("Hello world"),
              ),
              Container(
                // width ocupando tudo...
                width: double.infinity,
                color: Colors.green,
                height: 30,
                // aqui eu centralizo o texto verticalmente e centralizado..
                alignment: Alignment.centerLeft,

                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Text(
                  "Digite seu e-mail",
                ),
              ),
              Container(
                // width ocupando tudo...
                width: double.infinity,
                color: Colors.green,
                height: 30,
                // aqui eu centralizo o texto verticalmente e centralizado..
                alignment: Alignment.centerLeft,

                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Text(
                  "Digite sua senha",
                ),
              ),
              // isso daqui foi utilizado para dá um espaçamento
              // para os elementos deixando os próximos elementos texto ao máximo para baixo
              Expanded(
                child: Container(
                  color: Colors.blueAccent,
                ),
              ),
              const Text("Fazer login"),
            ],
          ),
        ),
      ),
    );
  }
}
