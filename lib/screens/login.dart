import 'package:flutter/material.dart';
import 'package:iwork_project/_comum/color_base.dart';
import 'package:iwork_project/_comum/snackbar.dart';
import 'package:iwork_project/components/decoration_labels.dart';
import 'package:iwork_project/main.dart';
import 'package:iwork_project/providers/auth_provider.dart';
import 'package:iwork_project/screens/home/base_view.dart';
import 'package:iwork_project/screens/home/home.dart';
import 'package:iwork_project/services/auth_services.dart';
import 'package:provider/provider.dart';

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
  TextEditingController _confirmaSenha = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AutenticationServices _authService = AutenticationServices();

  Color color = Color.fromARGB(255, 182, 176, 182);
  alterarCorClicado() {
    setState(() {
      color = Color.fromARGB(255, 102, 102, 73);
    });
  }

  alterarCorDesclicado() {
    setState(() {
      color = Color.fromARGB(255, 126, 123, 126);
    });
  }

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
                      const Text(
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
                          prefixIcon: Icon(Icons.email_sharp, color: color),
                          iconColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color, width: 3.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: color,
                          ),
                        ),
                        onTap: () => alterarCorClicado(),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          alterarCorDesclicado();
                        },
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
                          prefixIcon: Icon(Icons.lock, color: color),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color, width: 3.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: color,
                          ),
                        ),
                        obscureText: true,
                        onTap: () => alterarCorClicado(),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          alterarCorDesclicado();
                        },
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
                                prefixIcon: Icon(Icons.lock, color: color),
                                iconColor: Colors.black,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: color, width: 3.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: color,
                                ),
                              ),
                              obscureText: true,
                              controller: _confirmaSenha,
                              onTap: () => alterarCorClicado(),
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                alterarCorDesclicado();
                              },
                              validator: (String? value) {
                                if (value == null) {
                                  return "A cofirmação de senha não pode ser vazia";
                                }
                                if (value != _senhaController.text) {
                                  return "As senhas não são iguais";
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
                                prefixIcon: Icon(Icons.person, color: color),
                                iconColor: Colors.black,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: color, width: 3.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: color,
                                ),
                              ),
                              controller: _nomeController,
                              onTap: () => alterarCorClicado(),
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                alterarCorDesclicado();
                              },
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
    String confirmaSenha = _confirmaSenha.text;

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
              context: context,
              texto: "Falha no Login!!",
              isErro: false,
            );
          } else {
            if (mounted) {
              showSnackbar(
                context: context,
                texto: "Logou com sucesso!!",
                isErro: true,
              );
              AuthProvider.setToken(true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenHome(),
                ),
              );

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
            "${_emailController.text}, ${_senhaController.text}, ${_nomeController.text}, ${_confirmaSenha.text}");
        _authService
            .cadastrarUsuarios(
          nome: nome,
          email: email,
          senha: senha,
          confirmaSenha: confirmaSenha,
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

              AuthProvider.setToken(true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenHome(),
                ),
              );
            }
          }
        });
      }
    } else {
      print("Formulário inválido");
    }
  }
}
