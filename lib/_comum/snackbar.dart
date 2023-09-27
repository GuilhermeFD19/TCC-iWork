import 'package:flutter/material.dart';

showSnackbar(
    {required BuildContext context,
    required String texto,
    bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: (isErro)
        ? Color.fromARGB(255, 11, 197, 58)
        : Color.fromARGB(255, 240, 2, 2),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
    duration: const Duration(seconds: 4),
    action: SnackBarAction(
        label: 'Fechar',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
