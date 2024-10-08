import 'package:flutter/material.dart';
import 'package:agendlab2/app_images.dart';
import 'package:agendlab2/pages/home0.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool esconderSenha = true;
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 198, 212, 217),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: isLogin
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                            flex: 10,
                            child: Image.asset(
                              ImageAPP.pmvx,
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          alignment: Alignment.topCenter,
                          height: 80,
                          child:
                              const Text("SISTEMA DE AGENDAMENTO DE EXAMES")),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 30,
                          width: double.infinity,
                          child: TextField(
                            controller: userController,
                            onChanged: (value) {
                              debugPrint(value);
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.red,
                              ),
                              contentPadding: EdgeInsets.only(top: -3),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              hintText: "Usuário",
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 30,
                          width: double.infinity,
                          child: TextField(
                              obscureText: esconderSenha,
                              controller: senhaController,
                              onChanged: (value) {
                                debugPrint(value);
                              },
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.red,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      esconderSenha = !esconderSenha;
                                    });
                                  },
                                  child: Icon(
                                    esconderSenha
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.red,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(top: -3),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                hintText: "Senha",
                                hintStyle: const TextStyle(color: Colors.black),
                              ))),
                      const SizedBox(
                        height: 80,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  setState(() {
                                    isLogin = false;
                                  });
                                  if (userController.text == "smsvx" &&
                                      senhaController.text == "111") {
                                    setState(() {
                                      isLogin = true;
                                    });
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyHomePage()),
                                      );
                                      setState(() {
                                        isLogin = false;
                                      });
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Usuário ou senha errado"),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  "Entrar",
                                  style: TextStyle(color: Colors.black),
                                )),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(),
                        child: const Text("Cadastro"),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
