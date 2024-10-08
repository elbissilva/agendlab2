import 'dart:core';

class Paciente {
  String _nome = "";
  int _dataNasc = 0;
  int _id = 0;
  String _exame = "";
  String _opcao = "";
  bool _atendido = false;

  Paciente(this._nome, this._dataNasc, this._id, this._exame, this._opcao);

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  int get dn => _dataNasc;
   

  set dn (int dna) {
    _dataNasc = dn;
  }

  String get exame =>_exame;
   

  set exame(String exame) {
    _exame = exame;
  }

  String get opcao =>_opcao;
  

  set opcao(String opcao) {
    _opcao = opcao;
  }

  int get id =>_id;
  

  set id(int id) {
    _id = id;
  }

  bool get atendido => _atendido;

  set atendido(bool atendido) {
    _atendido = atendido;
  }
}
