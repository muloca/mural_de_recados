class Tarefa {
  String uid;
  String tipo;
  String tarefa;
  bool concluido = true;
  DateTime data;
  String professor;
  String classe;

  Tarefa(this.uid, this.tipo, this.tarefa, this.concluido, this.data,
      this.professor, this.classe);
}
