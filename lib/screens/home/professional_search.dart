import 'package:flutter/material.dart';

class ProfessionalSearch extends StatefulWidget {
  final List<String> professionals;
  final void Function(String query) onSearch;

  ProfessionalSearch({
    required this.professionals,
    required this.onSearch,
  });

  @override
  _ProfessionalSearchState createState() => _ProfessionalSearchState();
}

class _ProfessionalSearchState extends State<ProfessionalSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: widget.onSearch,
            decoration: InputDecoration(
              labelText: 'Pesquisar Profissionais',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.professionals.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.professionals[index]),
                // Adicione ação para cada profissional, se necessário
                onTap: () {
                  // Implemente a ação desejada ao selecionar um profissional
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
