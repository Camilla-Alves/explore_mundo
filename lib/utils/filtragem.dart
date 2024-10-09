String removerAcentos(String texto) {
  return texto
      .replaceAll(RegExp(r'[áàãâ]'), 'a')
      .replaceAll(RegExp(r'[éèê]'), 'e')
      .replaceAll(RegExp(r'[íìî]'), 'i')
      .replaceAll(RegExp(r'[óòõô]'), 'o')
      .replaceAll(RegExp(r'[úùû]'), 'u')
      .replaceAll(RegExp(r'[ç]'), 'c')
      .replaceAll(RegExp(r'[ÁÀÃÂ]'), 'A')
      .replaceAll(RegExp(r'[ÉÈÊ]'), 'E')
      .replaceAll(RegExp(r'[ÍÌÎ]'), 'I')
      .replaceAll(RegExp(r'[ÓÒÕÔ]'), 'O')
      .replaceAll(RegExp(r'[ÚÙÛ]'), 'U');
}

List<String> filtrarPacotes(List<String> pacotes, String query) {
  return pacotes.where((pacote) {
    String pacoteSemAcento = removerAcentos(pacote.toLowerCase());
    String querySemAcento = removerAcentos(query.toLowerCase());
    return pacoteSemAcento.contains(querySemAcento);
  }).toList();
}

