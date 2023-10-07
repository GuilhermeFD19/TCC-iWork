import 'package:iwork_project/models/autonomous_models.dart';

class AutonomousRepository {
  final List<AutonomousModels> listaAvaliacao = [
    AutonomousModels(
      id: '1',
      name: 'José Amparo',
      autonomous: 'Pedreiro',
      description: 'Reparo de encanamento residencial.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '2',
      name: 'Carlinhos Maia',
      autonomous: 'Eletricista',
      description: 'Instalação elétrica e reparos.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '3',
      name: 'Amando Batista',
      autonomous: 'Pedreiro',
      description: 'Reparos e construção de alvenaria.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '4',
      name: 'Josoelton Silva',
      autonomous: 'Encanador',
      description: 'Reparos de dutos e encanamentos.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '5',
      name: 'Arnaldo Sacumani',
      autonomous: 'Carpinteiro',
      description: 'Serviços de carpintaria e marcenaria.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '6',
      name: 'Zé do Pipo',
      autonomous: 'Jardineiro',
      description: 'Poda de árvores e plantas em geral.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '7',
      name: 'Isabele',
      autonomous: 'Manicure',
      description: 'Manicure e pedicure.',
      urlImage: 'assets/logo.png',
    ),
    AutonomousModels(
      id: '8',
      name: 'João',
      autonomous: 'Cabelereiro',
      description: 'Corte de cabelo e barba.',
      urlImage: 'assets/logo.png',
    ),
  ];

  getAutonomousByCategory(String categoria) {}
}
