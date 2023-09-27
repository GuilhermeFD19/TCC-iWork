import 'package:flutter/material.dart';
import 'package:iwork_project/models/autonomous_models.dart';

class SearchScreen extends StatelessWidget {
  final List<AutonomousModels> services = [
    AutonomousModels(
      id: '1',
      name: 'José Amparo',
      autonomous: 'Pedreiro',
      description: 'Reparo de encanamento residencial.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '2',
      name: 'Eletricista',
      autonomous: 'Eletricista',
      description: 'Instalação elétrica e reparos.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '3',
      name: 'Pedreiro',
      autonomous: 'Pedreiro',
      description: 'Reparos e construção de alvenaria.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '4',
      name: 'Pedreiro',
      autonomous: 'Pedreiro',
      description: 'Reparos e construção de alvenaria.',
      urlImage: 'assets/logo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ServiceCard(service: services[index]);
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  final AutonomousModels service;

  ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Sombra do card
      margin: EdgeInsets.all(16.0), // Margem ao redor do card
      child: Row(
        children: [
          // Imagem arredondada à esquerda
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/logo.png'), // Substitua pelo caminho da sua imagem local
              ),
            ),
          ),
          SizedBox(width: 16.0), // Espaço entre a imagem e as informações
          // Informações (título, descrição e avaliação) à direita
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  service.description,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
