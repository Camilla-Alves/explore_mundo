import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:explore_mundo/models/comentario.dart';

class ComentarioRepository {
  static const String _prefix = 'comentarios_';

  static Future<void> salvarComentarios(String destinoTitulo, List<Comentario> comentarios) async {
    final prefs = await SharedPreferences.getInstance();
    final String chaveComentarios = '$_prefix$destinoTitulo';
    final String comentariosString = jsonEncode(comentarios.map((comentario) => comentario.toJson()).toList());
    await prefs.setString(chaveComentarios, comentariosString);
  }

  static Future<List<Comentario>> carregarComentarios(String destinoTitulo) async {
    final prefs = await SharedPreferences.getInstance();
    final String chaveComentarios = '$_prefix$destinoTitulo';
    final String? comentariosString = prefs.getString(chaveComentarios);

    if (comentariosString != null) {
      final List<dynamic> comentariosJson = jsonDecode(comentariosString);
      return comentariosJson.map((json) => Comentario.fromJson(json)).toList();
    }
    return [];
  }
}
