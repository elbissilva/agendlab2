import 'package:flutter/material.dart';

class FinishedPage extends StatefulWidget {
  const FinishedPage({super.key});

  @override
  State<FinishedPage> createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 212, 217),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
          const SizedBox(
            height: 200,
          ),
          const Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 6,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 150,
                ),
              ),
              Expanded(flex: 2, child: SizedBox())
            ],
          ),
          const Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.person_add,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("Paciente cadastrado com sucesso!",
                            style: TextStyle(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}
