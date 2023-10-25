import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactApi {
  Future<String> postData({required Map<String, dynamic> dataContact}) async {
    try {
      final postResponse = await Dio().post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/',
        data: dataContact,
      );

      debugPrint(postResponse.data.toString());
      return postResponse.statusCode.toString();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getContact() async {
    try {
      final getResponse = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
      );

      debugPrint(getResponse.data.toString());
      return getResponse.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> putData({required Map<String, dynamic> dataPut}) async {
    try {
      final response = await Dio()
          .put('https://jsonplaceholder.typicode.com/posts/1', data: dataPut);

      debugPrint(response.data.toString());
      return response.statusCode.toString();
    } catch (e) {
      throw Exception(e);
    }
  }
}
