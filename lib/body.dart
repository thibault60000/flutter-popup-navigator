import 'package:flutter/material.dart';
import 'dart:async';
import 'page2.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,  children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, foregroundColor: Colors.white),
        onPressed: snack,
        child: const Text("SNACK",
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, foregroundColor: Colors.white),
        onPressed: alert,
        child: const Text("ALERT",
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, foregroundColor: Colors.white),
        onPressed: () => dialog('Titre', 'Description'),
        child: const Text("SIMPLE DIALOG",
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, foregroundColor: Colors.white),
        onPressed: () => goToPage2(),
        child: const Text("REDIRECTION",
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0)),
      )
    ]));
  }

  // Go Page 2
  void goToPage2() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const Page2(title: 'Page 2')));
  }

  // SNACKBAR
  void snack() {
    SnackBar snackBar = const SnackBar(
      content: Text('Une Snackbar', textScaleFactor: 1.5),
      duration: Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // SIMPLE DIALOG
  Future<void> dialog(String title, String description) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              title,
              textScaleFactor: 1.4,
            ),
            contentPadding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Text(description),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Confirmer'))
            ],
          );
        });
  }

  // ALERT
  Future<void> alert() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ceci est une alerte', textScaleFactor: 1.5),
            content: const Text("Contenu de l'alert, continuez ?"),
            contentPadding: const EdgeInsets.all(5.0),
            actions: [
              TextButton(
                  onPressed: () {
                    print("Annuler");
                    Navigator.pop(context); // pop = revenir en arrière
                  },
                  child: const Text("Annuler",
                      style: TextStyle(color: Colors.red))),
              TextButton(
                  onPressed: () {
                    print("Confirmer");
                    Navigator.pop(context); // pop = revenir en arrière
                  },
                  child: const Text("Confirmer",
                      style: TextStyle(color: Colors.blue)))
            ],
          );
        });
  }
}
