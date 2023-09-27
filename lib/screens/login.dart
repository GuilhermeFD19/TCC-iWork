import 'package:flutter/material.dart';
import 'package:iwork_project/_comum/color_base.dart';
import 'package:iwork_project/_comum/snackbar.dart';
import 'package:iwork_project/components/decoration_labels.dart';
import 'package:iwork_project/main.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/home.dart';
import 'package:iwork_project/services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool login = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _senhaRepeticao = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AutenticationServices _authService = AutenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                      Text(
                        "Seja Bem-Vindo!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 35),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'E-mail',
                          hintText: 'E-mail',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return "E-mail é obrigatório";
                          }
                          if (value.length < 5) {
                            return "E-mail é curto";
                          }
                          if (!value.contains("@")) {
                            return "E-mail inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Senha',
                          hintText: 'Senha',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazia";
                          }
                          if (value.length < 5) {
                            return "A senha é curta";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Visibility(
                        visible: !login,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Confirmar Senha',
                                hintText: 'Confirmar Senha',
                                prefixIcon: Icon(Icons.lock),
                                iconColor: Colors.black,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              obscureText: true,
                              controller: _senhaRepeticao,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A cofirmação de senha não pode ser vazia";
                                }
                                if (value.length < 5) {
                                  return "A confirmação de senha é curta";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !login,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Nome',
                                hintText: 'Nome',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              controller: _nomeController,
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "O nome é curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          botaoLogin();
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              MyColors.buttonColor, // Cor de fundo do botão
                          padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30), // Espaçamento interno
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Borda arredondada
                          ),
                        ),
                        child: Text((login) ? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            login = !login;
                          });
                        },
                        child: Text((login)
                            ? "Ainda não tem uma conta? Cadastre-se"
                            : "Já tem uma conta? Entre!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void botaoLogin() async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (login) {
        print("Entrou com sucesso");

        await _authService
            .logarUsuarios(
          nome: nome,
          email: email,
          senha: senha,
        )
            .then((String? erro) {
          if (erro != null) {
            showSnackbar(
                context: context, texto: "Falha no Login!!", isErro: false);
          } else {
            if (mounted) {
              showSnackbar(
                  context: context, texto: "Logou com sucesso!!", isErro: true);

              /*  Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BaseView(),
                ),
              ); */
            }
          }
        });
      } else {
        print("Cadastro validado");
        print(
            "${_emailController.text}, ${_senhaController.text}, ${_nomeController.text},");
        _authService
            .cadastrarUsuarios(
          nome: nome,
          email: email,
          senha: senha,
        )
            .then((String? erro) {
          if (erro != null) {
            showSnackbar(context: context, texto: erro);
          } else {
            if (mounted) {
              showSnackbar(
                  context: context,
                  texto: "Cadastrado com sucesso!!",
                  isErro: true);
            }
          }
        });
      }
    } else {
      print("Formulário inválido");
    }
  }
}
