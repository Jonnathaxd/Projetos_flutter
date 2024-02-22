import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recriando_projeto_padrao/pages/home_page.dart';
import 'package:recriando_projeto_padrao/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailInputValue = "";
  String passwordInputValue = "";
  TextEditingController emailInputController = TextEditingController();
  var passwordInputController = TextEditingController(
      // valor inicial...
      // text: "1234"
      );

  bool isObscurePasswordInput = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          // aqui é a box das regras padrão...
          child: ConstrainedBox(
            // propriedade desse construtor com as regras...
            constraints: BoxConstraints(
              // media query é um construtor que nos permite ter dados
              // do dispositivo como tamanho e etc...
              // o constext é uma variável padrão do flutter...
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 4,
                        // não utilizo mais tamanhos fixos com width e height no contianer para deixar
                        // tudo mais responsivo... em todos tamanhos de tela...

                        child: Image.network(
                            "https://hermes.dio.me/companies/a169bb67-5f72-4289-9778-fcea58dfa19a.png"),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ],
                  ),
                ),
                // aqui temos nosso texto próximo dos inputs...
                const Column(
                  children: [
                    Text(
                      "Já tem cadastro ?",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Faça seu login e make the change_",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),

                // gap de 24...
                const SizedBox(
                  height: 24,
                ),
                Container(
                  // width ocupando tudo...
                  width: double.infinity,
                  // height: 30,
                  // aqui eu centralizo o texto verticalmente e centralizado..
                  alignment: Alignment.centerLeft,

                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // Vale ressaltar que esse widget precisa de um container
                          // Caso contrário não funcionará dando erro...
                          child: TextField(
                            // o controller substitui a necessiadde
                            // do onchange para uma variável..
                            controller: emailInputController,
                            onChanged: (inputValue) {
                              emailInputValue = inputValue;
                            },
                            style: TextStyle(
                              // Cor do texto do input
                              color: Colors.grey.shade400,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              hoverColor: Colors.grey.shade400,

                              // aqui seria nosso parecido com o placeholder..
                              // labelText: "Digite seu email",
                              // o hintText estaria mais parecido com o placeholder, seria uma dica
                              // de tipo de dado...
                              hintText: "Digite seu e-mail",
                              hintStyle: TextStyle(color: Colors.grey.shade600),

                              // o widget inkWell funciona
                              // como container genérico para
                              // metodos, como ontap e etc...
                              // prefixIcon: InkWell(
                              //   onTap: () => {print("entrei...")},
                              //   // aqui eu adicionei o ícone...
                              //   child: Icon(
                              //     Icons.person,
                              //     // adicionei uma cor para o ícone...
                              //     color: Colors.grey.shade400,
                              //   ),
                              // ),
                              // outra forma de criar metodos genéricos...
                              // prefixIcon: GestureDetector(
                              //   onDoubleTap: () {},
                              //   child: Icon(
                              //     Icons.person,
                              //     // adicionei uma cor para o ícone...
                              //     color: Colors.grey.shade400,
                              //   ),
                              // ),
                              prefixIcon: Icon(
                                Icons.person,
                                // adicionei uma cor para o ícone...
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  // width ocupando tudo...
                  width: double.infinity,
                  // height: 30,
                  // aqui eu centralizo o texto verticalmente e centralizado..
                  alignment: Alignment.centerLeft,

                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    // o controller substitui a necessiadde
                    // do onchange para uma variável..
                    controller: passwordInputController,
                    onChanged: (inputValue) {
                      passwordInputValue = inputValue;
                    },
                    // keyboardType: TextInputType.number,

                    style: TextStyle(color: Colors.grey.shade400),
                    // aqui é pra deixar o texto oculto
                    // tipo um input password..
                    obscureText: isObscurePasswordInput,
                    decoration: InputDecoration(
                      // HOJE ISSO JÁ BEM AUTOMÁTICO
                      // MAS AQUI VOCÊ HABILITA AS BORDERS DO MUIUI..
                      // aqui é a estilização do border...
                      // existe outros tipos de border igual o mui ui...
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      // aqui é a estilização dele quando estiver focado...
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintText: "Digite sua senha",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey.shade400,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => {
                          // lembre do uso do setState para renderizar
                          // novamente o elemeto...
                          setState(() {
                            isObscurePasswordInput = !isObscurePasswordInput;
                          })
                        },
                        // aqui o ícone escolhido depende do valor da variável
                        icon: Icon(
                          isObscurePasswordInput
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        color: Colors.grey.shade400,
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                ),
                // gap de 24px...
                const SizedBox(
                  height: 24,
                ),
                Container(
                  // height: 32,
                  alignment: Alignment.center,
                  width: double.infinity,
                  // color: Colors.green,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SizedBox(
                    // aqui foi necessário para colcoar o botão na linha inteira...
                    width: double.infinity,
                    child: TextButton(
                      // veja que aqui eu tenho um ButtonStyle...
                      style: ButtonStyle(
                        // aqui é pra controlar o border radius...
                        shape: MaterialStateProperty.all(
                          // dentro desse all há vários outros métodos...
                          // utilizaremos o mesmo do exemplo...
                          RoundedRectangleBorder(
                            // aqui eu passaria o valor em px do border radius...
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                            // aqui é um pouco diferente para passar um background...
                            MaterialStateProperty.all(Colors.purple),
                      ),

                      // para utilizar o botão o onpressed é requisitado..
                      onPressed: () {
                        if (emailInputController.text.toLowerCase().trim() ==
                                "geova_jonnatha@hotmail.com" &&
                            passwordInputController.text == "1234") {
                          // aqui é o scafoldMessage
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login realizado com sucesso"),
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login or password incorrect"),
                            ),
                          );
                        }
                        // print("No submit ocorreu: ");
                        // print(
                        //     "O e-mail é: $emailInputValue e o password é: $passwordInputValue");

                        // quando utilizamos o controller pegamos os
                        // dados assim:

                        // print(passwordInputController.text);
                        // print(emailInputController.text);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // isso daqui foi utilizado para dá um espaçamento
                // para os elementos deixando os próximos elementos texto ao máximo para baixo
                Expanded(
                  child: Container(
                      // color: Colors.blueAccent,
                      ),
                ),
                Container(
                  height: 24,
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 4),
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 24,
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 24),
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
