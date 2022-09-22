import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(
          child: Text('Contenu de la page 2',
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.teal, fontStyle: FontStyle.italic)),
        ));
  }
}
