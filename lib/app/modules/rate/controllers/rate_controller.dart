import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class RateController extends GetxController {
  //TODO: Implement RateController

  final dio = Dio();
  var binanceRate =  0.0.obs; 



  void getBinancePriceValue() async {


  print(".......... Get Binance USD p2p value ......................");
  
  
  final url = 'https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search';
  final requestBody = {
    "asset": "USDT",
    "fiat": "LKR",
    "merchantCheck": true,
    "page": 1,
    "payTypes": ["BANK"],
    "publisherType": null,
    "rows": 1,
    "tradeType": "BUY"
  };

  try {
  final response = await dio.post(url, data: requestBody);
  final Map<String, dynamic> responseData = json.decode(response.toString());
  final double priceValue = double.parse(responseData['data'][0]['adv']['price']);
  print("..................Price Value is ${priceValue} ....................");
  binanceRate.value = priceValue;
} catch (error) {
  ErrorHandler.handleError(error);
}
  
}

Future<void> postData() async {
  final url = Uri.parse('https://cors-anywhere.herokuapp.com/https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'key': 'value'});

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Do something with the response data
    } else {
      throw Exception('Failed to post data: ${response.statusCode}');
    }
  } catch (error) {
    // Handle error
    print('Error: $error');
  }
}


Future<Map<String, dynamic>?> postRequest() async {
  final url = 'https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search';
  final body = {
    "asset": "USDT",
    "fiat": "LKR",
    "merchantCheck": true,
    "page": 1,
    "payTypes": ["BANK"],
    "publisherType": null,
    "rows": 5,
    "tradeType": "BUY"
  };

  try {
    final response = await http.post(Uri.https("p2p.binance.com","/bapi/c2c/v2/friendly/c2c/adv/search"),
        body: json.encode(body),
        headers: { "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'});
    final responseJson = json.decode(response.body);
    return responseJson;
  } catch (e) {
    print('Exception details:\n $e');
    return null;
  }
}

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    postData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}


class ErrorHandler {
  static void handleError(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.connectionTimeout||
          error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.sendTimeout) {
        // Handle timeout error
        print('Timeout Error: ${error.message}');
      } else if (error.type == DioErrorType.badResponse) {
        // Handle server error
        print('Server Error: ${error.response?.statusCode} - ${error.response?.statusMessage}');
      } else if (error.type == DioErrorType.cancel) {
        // Handle cancelled request error
        print('Request cancelled.');
      } else {
        // Handle other Dio errors
        print('Dio Error: ${error.message}');
      }
    } else {
      // Handle other types of errors
      print('Error: $error');
    }
  }
}