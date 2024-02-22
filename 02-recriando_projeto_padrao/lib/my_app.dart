import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recriando_projeto_padrao/pages/home_page.dart';
import 'package:recriando_projeto_padrao/pages/login_page_versao2.dart';

// toda essa estrutura foi criada pelo shortcut
// eu só adicionei o que está dentro do build...

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // o método build precisa também de um widget,
    // veja que esse Material app pode receber
    // inumeros dados... o principal seria esse home
    // que seria um widget que nós criaremos...
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      // isso daqui é pra remover o bannerzinho
      // com o nome debug no canto..r
      debugShowCheckedModeBanner: false,
    );
  }
}
