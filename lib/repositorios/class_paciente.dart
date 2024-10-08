class Paciente {
  String _nome = "";
  var _dn = "";
  var _id = "";
  var _exame = "";
  var _opcaoex = "";
  var _atendido = "";
  var _agendamento = "";

  Paciente(this._nome, this._dn, this._id, this._exame, this._opcaoex,
      this._atendido, this._agendamento) {
    _nome = nome;
    _dn = dn;
    _id = id;
    _exame = exame;
    _opcaoex = opcaoex;
    _atendido = atendido;
    _agendamento = agendamento;
  }
  get nome => _nome;
  set nome(nome) {
    _nome = nome;
  }

  get dn => _dn;
  set dn(dn) {
    _nome = nome;
  }

  get id => _id;
  set id(id) {
    _id = id;
  }

  get exame => _exame;
  set exame(exame) {
    _exame = exame;
  }

  get opcaoex => _opcaoex;
  set opcaoex(opcaoex) {
    _opcaoex = opcaoex;
  }

  get atendido => _atendido;
  set atendido(atendido) {
    _atendido = atendido;
  }

  get agendamento => _agendamento;
  set agendamento(agendamento) {
    _agendamento = agendamento;
  }
}
