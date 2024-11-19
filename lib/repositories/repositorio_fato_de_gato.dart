import 'package:dio/dio.dart';
import 'package:api_gatos/models/fato_de_gato.dart';

class CatRepository {
  final Dio dio = Dio();
  final String url = 'https://catfact.ninja/fact'; 
  FatoDeGato? cat;

  Future<void> getFact() async {
    try {
      final response = await dio.get(url);
      cat = FatoDeGato.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar o fato do gato: $e');
    }
  }
}
