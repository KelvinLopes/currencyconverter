import 'package:currencyconverter/app/models/currency_model.dart';
import 'package:flutter/widgets.dart';

class Homecontroller {
  List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  Homecontroller({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void converter() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValueConverted = 0;

    if (fromCurrency.name == 'Real') {
      returnValueConverted = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dollar') {
      returnValueConverted = value * toCurrency.dollar;
    } else if (fromCurrency.name == 'Euro') {
      returnValueConverted = value * toCurrency.euro;
    } else if (fromCurrency.name == 'bitcoin') {
      returnValueConverted = value * toCurrency.bitcoin;
    }

    fromText.text = returnValueConverted.toStringAsFixed(2);
  }
}
