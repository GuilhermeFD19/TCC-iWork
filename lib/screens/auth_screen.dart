import 'package:flutter/material.dart';
import 'package:iwork_project/_comum/color_base.dart';
import 'package:iwork_project/components/decoration_labels.dart';
import 'package:iwork_project/main.dart';
import 'package:iwork_project/screens/home.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool login = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.backgroundColor,
                  MyColors.backgroundColor,
                ],
              ),
            ),
          ),
          Form(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: 150,
                    ),
                    const Text(
                      "iWork",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: MyColors.textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 7,
                      ),
                    ),
                    Text(
                      "Seja Bem-Vindo!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.3),
                      child: TextFormField(
                        decoration: GetAuthenticationInputDecoration("E-mail"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.3),
                      child: TextFormField(
                        decoration: GetAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 7,
                      ),
                    ),
                    if (!login)
                      Padding(
                        padding: const EdgeInsets.all(15.3),
                        child: TextFormField(
                          decoration: GetAuthenticationInputDecoration(
                              "Confirme a Senha"),
                          obscureText: true,
                        ),
                      ),
                    if (!login)
                      Padding(
                        padding: const EdgeInsets.all(15.3),
                        child: TextFormField(
                          decoration:
                              GetAuthenticationInputDecoration("Nome Completo"),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => AuthScreen(),
                          ),
                        );
                      },
                      child: Text(
                        login ? "Login" : "Cadastrar",
                        style: TextStyle(
                          fontSize: 20,
                          color: MyColors.buttonTextColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.buttonColor,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            login = !login;
                          });
                        },
                        child: Text(
                          login ? "Criar uma conta" : "Já tenho uma conta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: MyColors.buttonColor,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
