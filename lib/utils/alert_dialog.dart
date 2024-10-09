import 'package:flutter/material.dart';

void showUnderDevelopmentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Em Desenvolvimento"),
        content: const Text("Esta funcionalidade ainda está em desenvolvimento."),
        actions: <Widget>[
          TextButton(
            child: const Text("Fechar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
