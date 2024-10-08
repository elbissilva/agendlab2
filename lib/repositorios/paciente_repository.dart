import 'package:agendlab2/model/paciente.dart';

class RepositoryPaciente {
  List<Paciente> _pacientes = [];

  void alterarEstado(int id, bool atendido) async {
    await Future.delayed(const Duration(seconds: 2));
    _pacientes.where((element) => element.id == id).first.atendido = atendido;
  }

  void adicionar(Paciente paciente) {
    _pacientes.add(paciente);
  }

  Future<List<Paciente>> listarPaciente() async {
    await Future.delayed(const Duration(seconds: 2));
    return _pacientes;
  }
}
