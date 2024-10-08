import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agendlab2/app_images.dart';

class AgendaPac extends StatefulWidget {
  const AgendaPac({Key? key}) : super(key: key);

  @override
  State<AgendaPac> createState() => _AgendaPacState();
}

class _AgendaPacState extends State<AgendaPac> {
  TextEditingController userSearchController = TextEditingController();
  Map<String, Color> tileColors =
      {}; // Variável para controlar a cor do ListTile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendados"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('pacientes')
            .orderBy(
                'agendamento') // Ordenar por data de agendamento decrescente
            .get(), // Recupere os dados do Firestore
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os dados'));
          }
          final pacientes = snapshot.data!.docs; // Obtenha os documentos
          return ListView.builder(
            itemCount: pacientes.length,
            itemBuilder: (context, index) {
              final paciente = pacientes[index];
              final pacienteId = paciente.id;
              final pacienteData = paciente.data()
                  as Map<String, dynamic>; // Atributos do paciente
              final tileColor = tileColors[pacienteId] ??
                  Colors.white; // Obter a cor associada ao paciente
              return ListTile(
                tileColor: tileColor, // Definir a cor do ListTile
                leading: Image.asset(ImageAPP.paciente),
                title: Text(
                  "Nome: ${pacienteData['nome']}",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w800),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exame: ${pacienteData['exame']}",
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Agendamento: ${pacienteData['agendamento']}",
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Clínica: ${pacienteData['opcoes']}",
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (menu) async {
                    if (menu == "Exame realizado" || menu == "Não compareceu") {
                      final updatedStatus = menu == "Exame realizado"
                          ? "Realizado"
                          : "Não Compareceu";

                      try {
                        await FirebaseFirestore.instance
                            .collection('pacientes')
                            .doc(pacienteId)
                            .update({'status': updatedStatus});

                        // Atualize a cor do ListTile
                        setState(() {
                          tileColors[pacienteId] = menu == "Exame realizado"
                              ? const Color.fromARGB(255, 178, 225, 179)
                              : Colors.red;
                        });

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Estado do paciente atualizado para: $updatedStatus"),
                          ),
                        );
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Erro ao atualizar o estado do paciente: $error"),
                          ),
                        );
                      }
                    }
                  },
                  itemBuilder: (BuildContext bc) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: "Exame realizado",
                        child: Text("Exame realizado"),
                      ),
                      const PopupMenuItem<String>(
                        value: "Não compareceu",
                        child: Text("Não compareceu"),
                      ),
                    ];
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
