class Comentario {
  final String usuario;
  final String texto;
  final DateTime dataHora;

  Comentario({required this.usuario, required this.texto, required this.dataHora});

  Map<String, dynamic> toJson() {
    return {
      'usuario': usuario,
      'texto': texto,
      'dataHora': dataHora.toIso8601String(),
    };
  }

  factory Comentario.fromJson(Map<String, dynamic> json) {
    return Comentario(
      usuario: json['usuario'],
      texto: json['texto'],
      dataHora: DateTime.parse(json['dataHora']),
    );
  }
}



