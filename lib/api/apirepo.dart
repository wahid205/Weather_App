import 'package:dio/dio.dart';

class ApiRepo {
  late Dio _dio;
  String? url;
  Map<String, dynamic>? payload;
  ApiRepo({this.payload, this.url});
  getData({
    Function()? beforesend,
    Function(dynamic data)? onsuccess,
    Function(dynamic error)? onerror,
  }) {
    _dio.get(url!, queryParameters: payload).then((value) {
      if (onsuccess != null) {
        onsuccess(value.data);
      }
    }).catchError((error) {
      onerror!(error);
    });
  }
}
