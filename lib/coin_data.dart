import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'bitcoin',
  'ethereum',
  'litecoin',
  'polkadot',
  'bitcoin-cash',
  'stellar',
  'chainlink',
  'binancecoin',
  'tether',
  'monero',
];

// const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = 'ED2DDA9B-17E9-4621-8406-AC001F7997D3';

const coinAPIURL = 'https://api.coingecko.com/api/v3/simple/price?ids=';

const apiKey = '';

//https://rest.coinapi.io/v1/exchangerate/BTC/EUR?apikey=ED2DDA9B-17E9-4621-8406-AC001F7997D3

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String priceUnit = selectedCurrency.toLowerCase();
      String requestURL = '$coinAPIURL$crypto&vs_currencies=$priceUnit';
      //'$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        String data = response.body;
        //var decodedData = jsonDecode(response.body);
        var price = jsonDecode(data)['$crypto']['$priceUnit'];
        cryptoPrices[crypto] = price.toString();
        print(cryptoPrices);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
