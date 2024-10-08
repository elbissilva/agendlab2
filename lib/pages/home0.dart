import 'package:flutter/material.dart';
import 'package:agendlab2/app_images.dart';
import 'package:agendlab2/widgets/custon_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int posicaoPage = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(76, 175, 80, 1),
          title: const Text(
            "AgendLab",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        drawer: const CustonDrawer(),
        backgroundColor: const Color.fromARGB(255, 198, 212, 217),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 200,
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
              height: 20,
            ),
            Row(children: [
              Expanded(child: Container()),
              const Expanded(
                  flex: 10,
                  child: Text(
                    "ElbisSilva Representações e Soluções Tecnológicas",
                    style: TextStyle(color: Colors.black),
                  )),
            ]),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    width: double.infinity,
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  ImageAPP.ifpa,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "AgendLab",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              " AgendLab é um projeto acadêmico que tem como principal proposta o desenvolvimento de uma ferramenta tecnológica para agendamento de exames por meio de uma plataforma móvel.",
                              textAlign: TextAlign.justify,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Ler mais"),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
