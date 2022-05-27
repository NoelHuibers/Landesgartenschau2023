// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
/* 
Dies handelt sich um FakeAPI call
In der Login Page folgendes eingeben um zu testen 
E-mail: eve.holt@reqres.in
Pass: cityslicka 
Hinweis: der Token wird auch bei flaschen pass von server gesendet
(!!!Email muss richtig sein!!!)
*/

class API_call {
  final Dio _dio = Dio();

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://reqres.in/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> register(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://reqres.in/api/register',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
