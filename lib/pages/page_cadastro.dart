import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agendlab2/pages/page_finished.dart';
import 'package:agendlab2/repositorios/repository_ex.dart';
import 'package:agendlab2/repositorios/repository_op.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PageCadastro extends StatefulWidget {
  const PageCadastro({super.key});

  @override
  State<PageCadastro> createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {
  var nomeController = TextEditingController(text: "");
  var dataNascController = TextEditingController(text: "");
  var idController = TextEditingController(text: "");
  DateTime? dataFormatada;
  DateTime? dataFormatada2;
  var examesRespository = Exames();
  var opcacaorRepository = Opcao();
  var opcoesSelecionadas = "";
  var opcoes = [];
  var exames = [];
  var exameSelecionado = "";
  var dataAgndController = TextEditingController(text: "");
  // final CHAVE_NOME = "CHAVE_NOME";
  // final CHAVE_DATA = "CHAVE_DATA";
  // final CHAVE_ID = "CHAVE_ID";
  // final CHAVE_EXAME = "CHAVE_EXAME";
  // final CHAVE_OPCAO = "CHAVE_OPCAO";

  bool salvando = false;
  late SharedPreferences storage;
  @override
  void initState() {
    exames = examesRespository.retornaExames();
    opcoes = opcacaorRepository.retornaOpcoes();
    super.initState();
    // carregarDados();
  }

  void main() {
    DateTime data = DateTime.now();
    String formatoDesejado = 'dd-MM-yyyy';
    String dataFormatada = DateFormat(formatoDesejado).format(data);
  }

  void mains() {
    DateTime data = DateTime.now();
    String formatoDesejado = "dd-MM-yyyy";
    String dataFormatada2 = DateFormat(formatoDesejado).format(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const Text(
                    "NOME:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: nomeController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "DATA DE NASCIMENTO:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: dataNascController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(1993, 1, 1),
                        firstDate: DateTime(1920, 1, 1),
                        lastDate: DateTime(2023, 6, 1),
                      );
                      if (data != null) {
                        setState(() {
                          dataNascController.text =
                              DateFormat('dd/MM/yyyy').format(data);
                          dataFormatada = data;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "ID:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: idController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "EXAME:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: exames
                        .map((exame) => RadioListTile(
                            selected: exameSelecionado == exame,
                            title: Text(exame.toString()),
                            value: exame.toString(),
                            groupValue: exameSelecionado,
                            onChanged: (value) {
                              setState(() {
                                exameSelecionado = value.toString();
                              });
                            }))
                        .toList(),
                  ),
                  const Text(
                    "OPÇÕES:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: opcoes
                        .map((opcao) => RadioListTile(
                            selected: opcoesSelecionadas == opcao,
                            title: Text(opcao.toString()),
                            value: opcao.toString(),
                            groupValue: opcoesSelecionadas,
                            onChanged: (value) {
                              setState(() {
                                opcoesSelecionadas = value.toString();
                              });
                            }))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "DATA DO ATENDIMENTO:",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: dataAgndController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2024, 9, 1),
                        firstDate: DateTime(2024, 9, 1),
                        lastDate: DateTime(2027, 6, 1),
                      );
                      if (data != null) {
                        setState(() {
                          dataAgndController.text =
                              DateFormat('dd/MM/yyyy').format(data);
                          dataFormatada2 = data;
                        });
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        salvando = false;
                      });

                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "O nome do paciente não foi preenchido")));
                        return;
                      }
                      if (dataFormatada == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Preencha a data de nascimento")));
                        return;
                      }
                      if (exameSelecionado == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Selecione um exame")));
                        return;
                      }
                      if (opcoesSelecionadas == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Selecione pelo menos uma opção")));
                        return;
                      }
                      if (dataFormatada2 == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Preencha a data de agendamento")));
                        return;
                      }
                      setState(() {
                        salvando = false;
                      });

                      try {
                        var db = FirebaseFirestore.instance;
                        final paciente = <String, dynamic>{
                          "nome": nomeController.text,
                          "dataNascimento": dataFormatada,
                          "id": idController.text,
                          "exame": exameSelecionado,
                          "opcoes": opcoesSelecionadas,
                          "agendamento":
                              DateFormat('yyyy-MM-dd').format(dataFormatada2!),
                        };
                        setState(() {
                          salvando = true;
                        });

                        var docRef =
                            await db.collection("pacientes").add(paciente);

                        print('DocumentSnapshot added with ID: ${docRef.id}');
                      } catch (error) {
                        print('Erro ao salvar no Firestore: $error');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Erro ao salvar os dados")));
                        setState(() {
                          salvando = false;
                        });
                      }

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FinishedPage()),
                      );
                      nomeController.text = "";
                      dataNascController.text = "";
                      idController.text = "";
                      dataAgndController.text = "";
                      exameSelecionado = "";
                      opcoesSelecionadas = "";

                      setState(() {
                        salvando = false;
                      });
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              ),
      ),
    );
  }
}
