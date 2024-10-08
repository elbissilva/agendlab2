import 'package:flutter/material.dart';
import 'package:agendlab2/app_images.dart';
import 'package:agendlab2/pages/login_page.dart';
import 'package:agendlab2/pages/page_cadastro.dart';
import 'package:agendlab2/pages/page_pedidos.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(ImageAPP.pmvx),
              ),
              accountName: const Text("SMSVX-PA"),
              accountEmail: const Text("smsvx@gmail.com")),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person_add),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Novo paciente"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PageCadastro()));
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.app_registration),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Agenda")
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AgendaPac()));
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Sair")
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text("AgendExame"),
                      content: const Wrap(
                        children: [
                          Text("Tem certeza que você deseja sair?"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim"))
                      ],
                    );
                  });
            },
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
