import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iwork_project/screens/home/base_view.dart';

void salvarAvaliacao(
    String uidAutonomo, double classificacao, String comentario) {
  final collection = FirebaseFirestore.instance.collection('avaliacoes');
  final novaAvaliacao = {
    'uid_autonomo': uidAutonomo,
    'classificacao': classificacao,
    'comentario': comentario,
  };

  collection
      .add(novaAvaliacao)
      .then((value) => print('Avaliação salva com sucesso'))
      .catchError((error) => print('Erro ao salvar a avaliação: $error'));
}

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 0.0;
  String comment = '';

  @override
  Widget build(BuildContext context) {
    return BaseView(
      index: 1,
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              "Perfil do Profissional",
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              "iWork",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 55, 63, 55),
        toolbarHeight: 72.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 40,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Escreva um comentário (opcional)',
              ),
              onChanged: (text) {
                setState(() {
                  comment = text;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 55, 63, 55),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                print('Classificação: $rating');
                print('Comentário: $comment');
                Navigator.pop(context);
              },
              child: Text('Avaliar'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: RatingScreen()));
}
