import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../coin_data.dart';

const String apiKey = 'C18C1B32-1793-4E05-AA06-60D244E832FA';

class CoinApi {
  final String currencyType;

  CoinApi({@required this.currencyType});

  Future getCurrency() async {
    var currencyValue = {};
    var path = "https://rest.coinapi.io/v1/exchangerate/{coin}/" +
        this.currencyType +
        '?apikey=';
    for (String coin in cryptoList) {
      var url = path.replaceAll('{coin}', coin);
      var uri = Uri.parse(url + apiKey);
      http.Response response = await http.get(uri);
      dynamic data;
      if (response.statusCode == 200) {
        String res = response.body;
        data = jsonDecode(res);
      }
      // currencyValue.add(data['rate']);
      currencyValue[data['asset_id_base']] = data['rate'];
    }
    return currencyValue;
  }
}
