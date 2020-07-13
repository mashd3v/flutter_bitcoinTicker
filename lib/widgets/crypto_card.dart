import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  CryptoCard({
    @required this.cryptoCurrency,
    @required this.value,
    @required this.selectedCurrency,
  });
  
  final String cryptoCurrency;
  final String value;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    String coinImage = cryptoCurrency;

    return Padding(
      padding: EdgeInsets.all(23.0),
      child: Container(
        height: 160.0,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 120.0,                             
              padding:EdgeInsets.all(17.0),                    
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.yellow[700],
              ),
              child: Center(
                child: Text(
                  '1 $cryptoCurrency = $value $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 5.0,
              child: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/$coinImage.png'),
                  radius: 35.0,
                  backgroundColor: Colors.white,
                ),
              ),
            ),                  
          ],
        ),
      ),
    );
  }
}