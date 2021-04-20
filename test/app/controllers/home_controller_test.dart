import 'package:currencyconverter/app/controllers/home_controller.dart';
import 'package:currencyconverter/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = Homecontroller(toText: toText, fromText: fromText);

  test('deve aceitar conversão usando vírgula', () {
    toText.text = '2,0';
    homeController.converter();
    expect(fromText.text, '0.36');
  });

  test('deve aceitar conversão usando ponto', () {
    toText.text = '2.0';
    homeController.converter();
    expect(fromText.text, '0.36');
  });

  test('deve converter de real para dollar', () {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
      name: 'Real',
      real: 1.0,
      dollar: 0.18,
      euro: 0.15,
      bitcoin: 0.000016,
    );

    homeController.fromCurrency = CurrencyModel(
      name: 'Dollar',
      real: 5.65,
      dollar: 1.0,
      euro: 0.85,
      bitcoin: 0.000008,
    );
    homeController.converter();
    expect(fromText.text, '0.18');
  });

  test('deve converter de dollar para real', () {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
      name: 'Dollar',
      real: 5.65,
      dollar: 1.0,
      euro: 0.85,
      bitcoin: 0.000008,
    );

    homeController.fromCurrency = CurrencyModel(
      name: 'Real',
      real: 1.0,
      dollar: 0.18,
      euro: 0.15,
      bitcoin: 0.000016,
    );
    homeController.converter();
    expect(fromText.text, '5.65');
  });
}
