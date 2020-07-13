import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:bitcoin_ticker/utils/constants.dart';
import 'package:bitcoin_ticker/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String selectedCurrency = 'AUD';
  // String bitcoinValueInUSD = '?';

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 120.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10.0),
                color: Colors.yellow[700],
                child: CupertinoPicker(
                  backgroundColor: Colors.yellow[700],
                  itemExtent: 32.0, 
                  onSelectedItemChanged: (selectedIndex){
                    setState(() {                  
                      selectedCurrency = currenciesList[selectedIndex];
                      getData();
                    });
                  }, 
                  children: getPickerItems(),
                ),
              ),
              Column(
                children: <Widget>[
                  CryptoCard(
                    cryptoCurrency: 'BTC',
                    value: isWaiting ? '?' : coinValues['BTC'], 
                    selectedCurrency: selectedCurrency
                  ),
                  CryptoCard(
                    cryptoCurrency: 'ETH',
                    value: isWaiting ? '?' : coinValues['ETH'], 
                    selectedCurrency: selectedCurrency
                  ),
                  CryptoCard(
                    cryptoCurrency: 'LTC',
                    value: isWaiting ? '?' : coinValues['LTC'], 
                    selectedCurrency: selectedCurrency
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Text> getPickerItems(){
    List<Text> dropdownItems = [];

    for(String currency in currenciesList){
      var newItem = Text(
        currency,
        style: TextStyle(
          color: Colors.white
        ),
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

}

