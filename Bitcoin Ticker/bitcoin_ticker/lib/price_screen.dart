import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/loader.dart';
import 'package:bitcoin_ticker/service/coinapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  var coinData;
  bool loader = true;

  void initState() {
    super.initState();
    getCoinRates('USD');
  }

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> cList = [];
    for (String curr in currenciesList) {
      cList.add(DropdownMenuItem(child: Text(curr), value: curr));
    }

    return DropdownButton(
      value: selectedCurrency,
      items: cList,
      onChanged: (val) {
        setState(() {
          selectedCurrency = val;
          getCoinRates(val);
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Widget> cList = [];
    for (String curr in currenciesList) {
      cList.add(Text(curr));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        getCoinRates(currenciesList[index]);
      },
      children: cList,
    );
  }

  getCoinRates(currency) async {
    setState(() {
      loader = true;
    });
    CoinApi coin = CoinApi(currencyType: currency);
    coinData = await coin.getCurrency();
    setState(() {
      loader = false;
    });
  }

  List<Widget> setCurrencyButton() {
    List<Widget> buttonList = [];
    for (int i = 0; i < cryptoList.length; i++) {
      buttonList.add(Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: coinButton(
              selectedCurrency: selectedCurrency,
              coinName: cryptoList[i],
              rate: coinData != null ? coinData[cryptoList[i]].toInt() : 0),
        ),
      ));
    }
    return buttonList;
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ? Loader()
        : Scaffold(
            appBar: AppBar(
              title: Text('🤑 Coin Ticker'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: coinData['BTC'] != null
                        ? setCurrencyButton()
                        : [Text('Select Currency')],
                  ),
                ),
                Container(
                  height: 150.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightBlue,
                  child: Platform.isIOS
                      ? getCupertinoPicker()
                      : getDropDownButton(),
                ),
              ],
            ),
          );
  }
}

class coinButton extends StatelessWidget {
  const coinButton({
    Key key,
    @required this.selectedCurrency,
    @required this.coinName,
    @required this.rate,
  }) : super(key: key);

  final String selectedCurrency;
  final String coinName;
  final int rate;

  @override
  Widget build(BuildContext context) {
    return Text(
      '1 ' +
          this.coinName +
          ' = ' +
          this.rate.toString() +
          ' ' +
          selectedCurrency,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }
}
