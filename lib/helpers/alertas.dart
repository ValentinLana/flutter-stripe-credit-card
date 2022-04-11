import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mostrarLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            final bol = await Future.delayed(Duration(seconds: 1));
            return bol;
          },
          child: const AlertDialog(
            title: Text('Espere ...'),
            content: LinearProgressIndicator(),
          ),
        );
      });
}

mostarAlerta(BuildContext context, String titulo, String mensaje) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          )
        ],
      );
    },
  );
}
