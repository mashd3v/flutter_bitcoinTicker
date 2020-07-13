import 'package:bitcoin_ticker/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 
  '5DD3C8E6-409D-4D93-8694-5344CAC9A9D2';
const coinAPIURL = 
  'https://rest.coinapi.io/v1/exchangerate';

class CoinData{
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    
    for(String crypto in cryptoList){
      String requestURL = 
        '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;    
  }
}

 