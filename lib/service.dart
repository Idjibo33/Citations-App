import 'dart:convert';

import 'package:citations/citation.dart';
import 'package:dio/dio.dart';

class ServiceCitation {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
    ),
  );

  Future<List<Quotes>> getCitations() async {
    try {
      final response = await dio.get('/quotes');
      final List<dynamic> resultat = response.data['quotes'];
      return resultat.map((json) => Quotes.fromJson(json)).toList();
    } on DioException catch (e) {
      print('errreur survenu : ${e.message}');
      throw Exception(e);
    }
  }
}
