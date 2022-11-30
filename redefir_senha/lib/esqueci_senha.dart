import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:redefir_senha/validatores.dart';
import 'package:validatorless/validatorless.dart';
import "package:flutter/material.dart";

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({super.key});

  @override
  State<EsqueciSenha> createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  bool _showPassword3 = false;
  bool _showPassWord4 = false;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();

  void dispose(){
    _email.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 120, left: 28),
                      child: Text(
                        "REDEFINIR SENHA",
                        style: TextStyle(fontSize: 36, fontFamily: "Teko"),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
                  child: TextFormField(
                    controller: _email,
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite seu email"),
                      Validatorless.email("Email inválido"),
                    ]),
                    decoration: InputDecoration(
                        hintText: "Digite seu email",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        ),
                  
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
                  child: TextFormField(
                    controller: _password,
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite sua nova senha"),
                      Validatorless.min(
                          6, "Senha precisa ter no minimo 6 caracteres"),
                    ]),
                    decoration: InputDecoration(
                        hintText: "Digite sua nova senha",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPassword3 == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword3 = !_showPassword3;
                            });
                          },
                        )),
                    obscureText: _showPassword3 == false ? true : false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
                  child: TextFormField(
                    controller: _passwordConfirm,
                    validator: Validatorless.multiple([
                      Validatorless.required("Confirme sua nova senha"),
                      Validatorless.min(
                          6, "Senha precisa ter no minimo 6 caracteres"),
                      Validators.compare(_password, "Digite uma senha valida")
                    ]),
                    decoration: InputDecoration(
                        hintText: "Confirme sua nova senha",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPassWord4 == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassWord4 = !_showPassWord4;
                            });
                          },
                        )),
                    obscureText: _showPassWord4 == false ? true : false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                  ),
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        var formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {}
                      },
                      child: Text("Confirmar"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                    ),
                    width: 313,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}