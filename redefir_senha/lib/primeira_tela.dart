import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrimeiraTela extends StatefulWidget {
  PrimeiraTela({super.key});

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  bool _showPassword = false;
  bool _showPassword2 = false;
  @override
  Widget build(BuildContext context) {
    return Form(
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
                    decoration: InputDecoration(
                        hintText: "Digite sua nova senha",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPassword == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        )),
                    obscureText: _showPassword == false ? true : false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Confirme sua nova senha",
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPassword2 == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword2 = !_showPassword2;
                            });
                          },
                        )),
                    obscureText: _showPassword2 == false ? true : false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                  ),
                  child: Container(
                    child: ElevatedButton(onPressed: (){}, child: Text("Confirmar"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
                    ),
                    ),
                    width: 313,
                    
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
