import 'package:api_gatos/models/fato_de_gato.dart';
import 'package:flutter/material.dart';
import 'package:api_gatos/repositories/repositorio_fato_de_gato.dart';

void main() {
  runApp(const MaterialApp(home: CatScreen()));
}

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  final CatRepository repository = CatRepository();
  FatoDeGato? catFact;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await repository.getFact();
    setState(() {
      catFact = repository.cat; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fato sobre Gatos')),
      body: catFact == null
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fato: ${catFact!.fact}', style: const TextStyle(fontSize: 18)),
                Text('Comprimento: ${catFact!.length}', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
    );
  }
}
